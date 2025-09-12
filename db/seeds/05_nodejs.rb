cat = Category.find_by(name: 'Backend Development')

pp 'Creating NodeJS topic'
# Add topics to it
topic = cat.topics.create!(name: 'NodeJS', slug: 'node-js')

pp "Creating 'installation' article for NodeJS"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation')

pp "Creating 'sections' for 'installation' for NodeJS"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...')
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...')
