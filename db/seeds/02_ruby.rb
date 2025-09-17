norman = User.find_by(email: 'nrmndev@gmail.com')
collection = Collection.find_by(title:"Ruby on Rails 101")
category = Category.find_by(title: 'Programming', slug: 'programming')
pp 'Creating Ruby on Rails topic'
# Add topics to it
topic = Topic.new(title: 'Ruby on Rails', slug: 'ruby-on-rails', user: norman, visibility: 0)
topic.user_id = norman.id
topic.save!

pp "Creating 'installation' article for Ruby on rails"
# Add articles to that topic
post = Post.new(title: 'Installation', slug: 'installation', visibility: 0)
post.topic_id = topic.id
post.user_id = topic.user_id
post.save!

pp "Creating 'sections' for 'installation' for Ruby on rails"
# Add sections to the article
part = Part.new(title: 'Download instructions', description: 'Lorem ipsum...', visibility: 0)
part.post_id = post.id
part.user_id = topic.user_id
part.save!

part2 = Part.new(title: 'Using Doctypes', description: 'Lorem ipsum...', visibility: 0)
part2.post_id = post.id
part2.user_id = topic.user_id
part2.save!
