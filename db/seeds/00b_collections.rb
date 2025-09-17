pp 'Creating Collection'
cat = Category.find_by(title: 'Programming')
norman = User.find_by(email: "nrmndev@gmail.com")
collection = Collection.new(title: 'Ruby on Rails', slug: 'ruby-on-rails')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!

collection = Collection.new(title: 'Tailwind CSS', slug: 'tailwindcss')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!

collection = Collection.new(title: 'React JS', slug: 'reactjs')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!

collection = Collection.new(title: 'Next JS', slug: 'nextjs')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!

collection = Collection.new(title: 'Node JS', slug: 'nodejs')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!

collection = Collection.new(title: 'PostgreSQL', slug: 'postgresql')
collection.category_id = cat.id
collection.user_id = norman.id
collection.save!
