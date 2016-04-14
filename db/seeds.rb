20.times do
  title = Faker::Lorem.sentence(1)
  content = Faker::Lorem.paragraphs(5).reduce(:+)
  Post.create(title: title, content: content)
end