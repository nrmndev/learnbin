norman = User.find_by(email: 'nrmndev@gmail.com')

common_post_attrs = {
  visibility: 0,
  user_id: norman.id
}
collection = Collection.find_by(title:'Node JS')

pp 'Creating Next JS topic'
# Add topics to it

topics = ['Installation', 'Usefull packages', 'Routing']
topics.each_with_index do |title, index|
  topic = Topic.create!(common_post_attrs.merge(title: title))

  CollectionTopic.create!(
    collection_id: collection.id,
    topic_id: topic.id,
    position: index
  )
end

############# POST FOR TOPIC 1
ct = CollectionTopic
       .joins(:topic)
       .where(collection_id: collection.id, topics: { title: 'Installation' })
       .first

posts = ['Installation - 1', 'Installation - 2', 'Installation - 3', 'Installation - 4', 'Installation - 5', 'Installation - 6']

posts.each_with_index do |title, index|
  pp "Creating Post: #{title} for topic_id: 1"
  post = Post.create!(common_post_attrs.merge(title: "NodeJS #{title}"))
  pp "Adding TopicPost: post_id:#{post.id} and topic_id: 1"
  TopicPost.create!(
    topic_id: ct.topic_id,
    post_id: post.id,
    position: index + 1
  )
end
pp 'Post and TopicPosts created successfully'


############# POST FOR POST 1

post1 = Post.find_by(title: 'NodeJS Installation - 1')

parts = ['Part 1', 'Part 2', 'Part 3', 'Part 4', 'Part 5', 'Part 6', 'Part 7']
parts.each_with_index do |title, index|
  pp "Creating Part: #{title} for post_id: 1"
  part = Part.create!(common_post_attrs.merge(title: title, description: "lorem ipsum #{index}"))
  pp "Creating PostParts:"
  PostPart.create!(
    part_id: part.id,
    post_id: post1.id,
    position: index + 1
  )
end
pp 'Part and PostParts created successfully'
