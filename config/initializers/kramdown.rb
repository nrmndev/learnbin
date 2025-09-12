require 'kramdown'

# Configure Kramdown to use CodeRay for syntax highlighting
# Kramdown::Document.class_eval do
#   def initialize(text, options = {})
#     options[:syntax_highlighter] ||= 'coderay'
#     super(text, options)
#   end
# end

Kramdown::Document.class_eval do
  alias_orig = instance_method(:initialize)
  define_method(:initialize) do |text, options = {}|
    options[:parse_block_html] = true
    alias_orig.bind(self).call(text, options)
  end
end
