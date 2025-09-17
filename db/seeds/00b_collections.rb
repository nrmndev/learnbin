pp 'Creating Collection'
cat = Category.find_by(title: 'Programming')
norman = User.find_by(email: "nrmndev@gmail.com")
collection = Collection.new(title: 'Ruby on Rails 101', slug: 'ruby-on-rails-101')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!
