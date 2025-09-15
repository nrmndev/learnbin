cat = Category.find_by(name: 'Backend Development')
norman = User.find_by(email: 'nrmndev@gmail.com')
pp 'Creating Ruby on Rails topic'
# Add topics to it
topic = cat.topics.create!(name: 'Ruby on Rails', slug: 'ruby-on-rails', user: norman, visibility: 0)

pp "Creating 'installation' article for Ruby on rails"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation', visibility: 0)

pp "Creating 'sections' for 'installation' for Ruby on rails"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...', visibility: 0)
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...', visibility: 0)
