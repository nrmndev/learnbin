cat = Category.find_by(name: 'Backend Development')

pp 'Creating Ruby on Rails topic'
# Add topics to it
topic = cat.topics.create!(name: 'Ruby on Rails', slug: 'ruby-on-rails')

pp "Creating 'installation' article for Ruby on rails"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation')

pp "Creating 'sections' for 'installation' for Ruby on rails"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...')
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...')
