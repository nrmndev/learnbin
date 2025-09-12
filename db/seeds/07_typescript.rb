cat = Category.find_by(name: 'Frontend Development')

pp 'Creating Typescript topic'
# Add topics to it
topic = cat.topics.create!(name: 'Typescript', slug: 'typescript')

pp "Creating 'installation' article for Typescript"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation')

pp "Creating 'sections' for 'installation' for Typescript"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...')
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...')
