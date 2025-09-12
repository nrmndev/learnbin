module ApplicationHelper
  # require 'redcarpet'
  # require 'rouge'
  # require 'rouge/plugins/redcarpet'

  # class HTMLwithRouge < Redcarpet::Render::HTML
  #   include Rouge::Plugins::Redcarpet
  # end

  # def markdown(text)
  #   return "" if text.blank?

  #   renderer_opts = {
  #     filter_html: true,
  #     hard_wrap: true,
  #     link_attributes: { rel: 'nofollow', target: '_blank' }
  #   }

  #   extensions = {
  #     fenced_code_blocks: true,
  #     autolink: true,
  #     tables: true,
  #     strikethrough: true
  #   }

  #   renderer = HTMLwithRouge.new(renderer_opts)
  #   md = Redcarpet::Markdown.new(renderer, extensions)
  #   md.render(text).html_safe
  # end

  def render_markdown(text)
    Kramdown::Document
      .new(text, input: 'GFM', syntax_highlighter: :rouge, parse_block_html: true)
      .to_html
      .html_safe
  end

   def highlight_code(text)
    html = text.to_s

    # 1) Markdown fences: ```lang \n ... ```
    #    Escape code, DO NOT convert to <br> or &nbsp; — <pre> will preserve newlines/spaces.
    html = html.gsub(/```([\w+-]+)?\s*\n(.*?)```/m) do
      lang = Regexp.last_match(1).to_s
      code = Regexp.last_match(2)
      escaped = ERB::Util.html_escape(code)
      build_code_block(escaped, lang, escape_already_done: true)
    end

    # 2) TinyMCE HTML: <pre><code ...>…<br>…</code></pre>
    #    Keep inner HTML AS-IS (no escaping), so <br> renders as line breaks.
    html = html.gsub(%r{<pre>\s*<code([^>]*)>(.*?)</code>\s*</pre>}mi) do
      attrs = Regexp.last_match(1)
      inner = Regexp.last_match(2)

      lang =
        attrs[/data-lang=["']?([\w+-]+)["']?/i, 1] ||
        attrs[/language-([\w+-]+)/i, 1] ||
        ""

      build_code_block(inner, lang, attrs_override: attrs, escape_already_done: true)
    end

    html.html_safe
  end

  private

  # Wrap with header + copy, output <pre><code> preserving inner HTML
  def build_code_block(code_inner, lang, attrs_override: nil, escape_already_done: false)
    label = lang.present? ? lang.upcase : "TEXT"

    code_attrs = attrs_override ? attrs_override.dup : ""
    if lang.present?
      if code_attrs !~ /class=/i
        code_attrs << %( class="language-#{lang}")
      elsif code_attrs !~ /language-#{Regexp.escape(lang)}/i
        code_attrs.sub!(/class=(['"])(.*?)\1/i) { %(class="#{$2} language-#{lang}") }
      end
    end

    code_html = escape_already_done ? code_inner : ERB::Util.html_escape(code_inner)

    content_tag(:div, class: "code-block", data: { controller: "clipboard" }) do
      header = content_tag(:div, class: "code-header") do
        content_tag(:span, label, class: "code-lang-label") +
          content_tag(:button, "Copy", class: "copy-btn", data: { action: "click->clipboard#copy" })
      end

      pre_html = "<pre><code#{code_attrs}>#{code_html}</code></pre>".html_safe
      header + pre_html
    end
  end
end
