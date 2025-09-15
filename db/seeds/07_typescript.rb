cat = Category.find_by(name: 'Frontend Development')
norman = User.find_by(email: 'nrmndev@gmail.com')
pp 'Creating Typescript topic'
# Add topics to it
topic = cat.topics.create!(name: 'Typescript', slug: 'typescript', user_id: norman.id, visibility: 0)

pp "Creating 'installation' article for Typescript"
# Add articles to that topic
article = topic.articles.create!(title: 'Installation', slug: 'installation', visibility: 0)

pp "Creating 'sections' for 'installation' for Typescript"
# Add sections to the article
article.sections.create!(heading: 'Download instructions', content: 'Lorem ipsum...', visibility: 0)
article.sections.create!(heading: 'Using Doctypes', content: 'Lorem ipsum...', visibility: 0)
