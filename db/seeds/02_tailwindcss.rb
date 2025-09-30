norman = User.find_by(email: 'nrmndev@gmail.com')
collection = Collection.find_by(title: 'Tailwind CSS')
category = Category.find_by(title: 'Programming', slug: 'programming')
pp 'Creating Tailwind CSS topic'
# Add topics to it
topic = Topic.new(title: 'TailwindCSS Installation', slug: 'tailwindcss-installation', user: norman, visibility: 0)
topic.user_id = norman.id
topic.save!


# Associate topic to collection_topic
CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: topic.id,
  position: 1
)

pp "Creating 'installation' part for TailwindCSS"

post = Post.new(title: 'via NPM', slug: 'installation', visibility: 0)
# post.topic_id = topic.id
post.user_id = topic.user_id
post.save!

pp "Creating 'parts' for 'installation' for TailwindCSS"
# Add sections to the article
part = Part.new(title: 'Download instructions', description: 'Lorem ipsum...', visibility: 0)
part.post_id = post.id
part.user_id = topic.user_id
part.save!

part2 = Part.new(title: 'Using Doctypes', description: 'Lorem ipsum...', visibility: 0)
part2.post_id = post.id
part2.user_id = topic.user_id
part2.save!
