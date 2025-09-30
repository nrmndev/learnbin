pp 'Creating Categories'

categories = ['Programming', 'Leisure', 'Sports', 'Music']

categories.each do |category|
  Category.create!(title: category)
end
