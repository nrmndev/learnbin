require 'faker'

faker_user = User.find_by(email: 'faker@gmail.com')
category = Category.find_or_create_by(title: 'Programming')
collection = Collection.new(title: "#{Faker::Lorem.sentence(word_count: 3)}", slug: 'faker-slug')
collection.category_id = category.id
collection.user_id = faker_user.id
collection.save!

pp 'Creating Faker Data'

10.times do
  topic = Topic.new(title: "#{Faker::Lorem.sentence(word_count: 3)}", user: faker_user, visibility: 0)
  topic.user_id = faker_user.id
  topic.save!

    10.times do
    post = Post.new(title: "#{Faker::Lorem.sentence(word_count: 3)}", visibility: 0)
    # post.topic_id = topic.id
    post.user_id = topic.user_id
    post.save!

    TopicPost.create!(
      topic_id: topic.id,
      post_id: post.id,
      position: 1
    )

    5.times do
      part = Part.new(title: "#{Faker::Lorem.sentence(word_count: 3)}", description: "#{Faker::Lorem.paragraph(sentence_count: 3)}", visibility: 0)
      part.post_id = post.id
      part.user_id = topic.user_id
      part.save!
    end
  end
end

first_topic = Topic.where(user_id: faker_user).first
CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: first_topic.id,
  position: 1
)
