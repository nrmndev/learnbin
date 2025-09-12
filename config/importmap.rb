# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "highlight.js", to: "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/es/highlight.min.js"
# pin "tinymce", to: "https://cdn.jsdelivr.net/npm/tinymce@6.8.2/tinymce.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
