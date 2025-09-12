# Create a category
cat = Category.find_by(name: 'Frontend Development')

pp 'Creating ReactJS topic'
# Add topics to it
topic = cat.topics.create!(name: 'ReactJS', slug: 'react-js')

pp "Creating 'installation' article for ReactJS"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation')

pp "Creating 'sections' for 'installation' for ReactJS"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...')
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...')
