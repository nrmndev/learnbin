pp 'Creating Collection'
cat = Category.find_by(title: 'Programming')
norman = User.find_by(email: 'nrmndev@gmail.com')

titles = ['Ruby on Rails', 'Tailwind CSS', 'React JS', 'Next JS', 'Node JS', 'PostgreSQL']

titles.each do |title|
  Collection.create!(
    title: title,
    category_id: cat.id,
    user_id: norman.id
  )
end
