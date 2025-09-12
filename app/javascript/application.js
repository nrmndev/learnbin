// app/javascript/application.js
import "@hotwired/turbo-rails";
import "controllers";
import hljs from "highlight.js";

function normalizeAndHighlight(root = document) {
  root.querySelectorAll("pre code").forEach((el) => {
    // turn HTML into raw text: <br> -> '\n', '&nbsp;' -> ' ', decode entities
    // innerText gives you the visual text with real newlines
    const raw = el.innerText;
    // replace the element's content with the raw text so HLJS can parse it
    el.textContent = raw.replace(/\u00A0/g, " ");
    hljs.highlightElement(el);
  });
}

document.addEventListener("turbo:load", () => normalizeAndHighlight(document));
document.addEventListener("turbo:frame-load", (e) =>
  normalizeAndHighlight(e.target)
);
