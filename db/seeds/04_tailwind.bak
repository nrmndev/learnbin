cat = Category.find_by(name: 'Frontend Development')
norman = User.find_by(email: 'nrmndev@gmail.com')
pp 'Creating TailwindCSS topic'
# Add topics to it
topic = cat.topics.create!(name: 'Tailwind CSS', slug: 'tailwind-css', user_id: norman.id, visibility: 0)
