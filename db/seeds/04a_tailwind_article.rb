cat = Category.find_by(name: 'Frontend Development')

pp 'Creating TailwindCSS topic'

# Add topics to it
topic = cat.topics.find_by(slug: 'tailwind-css')

pp "Creating 'installation' article for TailwindCSS"
# Add articles to that topic

summary = '# Install Tailwind CSS as a Vite Plugin (Markdown Column Layout)
| Step | Command / Code |
|------|----------------|
| **1. Create your project**<br>Start by scaffolding a new Vite project (e.g. via Create Vite). | ```bash npm create vite@latest my-project cd my-project ``` |
'
summary_two = '
```bash
npm create vite@latest my-project
cd my-project
```
'
article = topic.articles.create!(title: 'Installation', slug: 'installation', summary: summary)

pp "Creating 'sections' for 'installation' for TailwindCSS"
# Add sections to the article
article.sections.create!(heading: 'Using Vite', content: 'Lorem ipsum...Using Vite')
article.sections.create!(heading: 'Using PostCSS', content: 'Lorem ipsum...Using PostCSS')
article.sections.create!(heading: 'Tailwind CLI', content: 'Lorem ipsum...Tailwind CLI')
article.sections.create!(heading: 'Framework Guides', content: 'Lorem ipsum...Framework Guides')
article.sections.create!(heading: 'Play CDN', content: 'Lorem ipsum...Play CDN')


article = topic.articles.create!(title: 'Official Documentation', slug: 'official-documentation')
