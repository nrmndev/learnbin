cat = Category.find_by(name: 'Frontend Development')

pp 'Creating TailwindCSS topic'
# Add topics to it
topic = cat.topics.create!(name: 'Tailwind CSS', slug: 'tailwind-css')
