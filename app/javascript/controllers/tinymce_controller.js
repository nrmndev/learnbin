import { Controller } from "@hotwired/stimulus";

const TINYMCE_URL = "https://cdn.jsdelivr.net/npm/tinymce@6.8.2/tinymce.min.js";
const SKIN_URL = "https://cdn.jsdelivr.net/npm/tinymce@6.8.2/skins/ui/oxide";
const CONTENT_CSS =
  "https://cdn.jsdelivr.net/npm/tinymce@6.8.2/skins/content/default/content.min.css";

export default class extends Controller {
  static targets = ["textarea"];

  async connect() {
    this.ensureId();
    await this.loadTinyMCE();
    this.initEditor();
    // Clean up before Turbo caches the page
    this.beforeCache = () => this.removeEditor();
    document.addEventListener("turbo:before-cache", this.beforeCache);
  }

  disconnect() {
    this.removeEditor();
    document.removeEventListener("turbo:before-cache", this.beforeCache);
  }

  ensureId() {
    if (!this.textareaTarget.id) {
      this.textareaTarget.id = `tinymce-${Math.random().toString(36).slice(2)}`;
    }
  }

  loadTinyMCE() {
    if (window.tinymce) return Promise.resolve();

    if (!window.__tinymceLoadingPromise) {
      window.__tinymceLoadingPromise = new Promise((resolve, reject) => {
        const s = document.createElement("script");
        s.src = TINYMCE_URL;
        s.referrerPolicy = "origin";
        s.onload = () => resolve();
        s.onerror = () => reject(new Error("Failed to load TinyMCE"));
        document.head.appendChild(s);
      });
    }
    return window.__tinymceLoadingPromise;
  }

  initEditor() {
    const id = this.textareaTarget.id;
    // If an editor on this element already exists, remove it first (helps with Turbo frames)
    const existing = window.tinymce.get(id);
    if (existing) existing.remove();

    window.tinymce.init({
      selector: `#${id}`,
      menubar: false,
      plugins: "link lists code table",
      toolbar:
        "undo redo | styles | bold italic underline | bullist numlist | link table | code",
      height: 420,
      forced_root_block: false, // don't wrap everything in <p>
      extended_valid_elements: "pre[class],code[class]",
      entity_encoding: "raw",
      content_style: "pre code { white-space: pre; }", // preserve indentation
      // Make Tab and Shift+Tab indent inside editor instead of moving focus
      indentation: "2ch", // optional: width of indentation
      codesample_global_prismjs: false, // we're using highlight.js instead of Prism
      // Point TinyMCE to its assets (needed when self-hosting via CDN)
      skin_url: SKIN_URL,
      content_css: CONTENT_CSS,
      // Keep the underlying <textarea> in sync for Rails form submits
      setup: (editor) => {
        editor.on("change keyup blur", () => editor.save());
        // Optional: insert fenced block on shortcut
        editor.addShortcut("meta+shift+c", "Insert code block", () => {
          editor.insertContent('<pre><code data-lang="">\n\n</code></pre>');
          const rng = editor.selection.getRng();
          rng.setStart(rng.startContainer, 0);
        });

        editor.on("keydown", (e) => {
          if (e.key === "Tab") {
            e.preventDefault();

            const selection = editor.selection;
            const rng = selection.getRng();
            const node = selection.getNode();

            // Current text container
            const textNode = rng.startContainer;
            const offset = rng.startOffset;

            if (e.shiftKey) {
              // SHIFT + TAB → remove 2 spaces from start of current line
              const lineEl = selection.getRng().startContainer;
              let line = lineEl.textContent || "";

              // Find beginning of line relative to selection
              const start = line.lastIndexOf("\n", offset - 1) + 1;
              const prefix = line.substring(start, start + 2);

              if (prefix === "  ") {
                // remove 2 spaces
                const newLine =
                  line.substring(0, start) + line.substring(start + 2);

                lineEl.textContent = newLine;
                // reset caret
                rng.setStart(lineEl, Math.max(offset - 2, start));
                rng.collapse(true);
                selection.setRng(rng);
              }
            } else {
              // TAB → insert 2 spaces
              editor.execCommand("mceInsertContent", false, "  ");
            }
          }
        });
      },
    });
  }

  removeEditor() {
    const id = this.textareaTarget?.id;
    const ed = id && window.tinymce ? window.tinymce.get(id) : null;
    if (ed) ed.remove();
  }
}
