norman = User.find_by(email: 'nrmndev@gmail.com')
collection = Collection.find_by(title:"Ruby on Rails")
category = Category.find_by(title: 'Programming', slug: 'programming')
pp 'Creating Ruby on Rails topic'
# Add topics to it
topic = Topic.new(title: 'Ruby on Rails Installation', slug: 'ruby-on-rails-installation', user: norman, visibility: 0)
topic.user_id = norman.id
topic.save!

topic_2 = Topic.new(title: 'Useful Gems', slug: 'useful-gems', user: norman, visibility: 0)
topic_2.user_id = norman.id
topic_2.save!

# Associate topic to collection_topic
CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: topic.id,
  position: 1
)

CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: topic_2.id,
  position: 2
)

pp "Creating 'installation' article for Ruby on rails"
# Add articles to that topic
post = Post.new(title: 'Installation', slug: 'installation', visibility: 0)
# post.topic_id = topic.id
post.user_id = topic.user_id
post.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post.id,
  position: 1
)

TopicPost.create!(
  topic_id: topic.id,
  post_id: post.id,
  position: 2
)

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
