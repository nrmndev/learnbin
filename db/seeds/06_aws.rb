cat = Category.find_by(name: 'Cloud')

pp 'Creating AWS topic'
# Add topics to it
topic = cat.topics.create!(name: 'Amazon Web Services', slug: 'aws')

pp "Creating 'installation' article for Amazon Web Services"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation')

pp "Creating 'sections' for 'installation' for Amazon Web Services"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...')
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...')
