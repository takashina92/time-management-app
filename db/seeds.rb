# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'aaa'
  email: 'aaa@aaa.com'
  passsword: 'aaaa'
)

5.times do |n|
  User.create!(
    name: "テスト#{n+1}@"
    email: "test#{n+1}@test.com"
    passsword: "test"
  )
end

User.all.each do |user|
  20.times do
    content = Faker::Lorem.sentence(1)
    user.tasks.create!(content: content, done: 0, user_id: user.id)
  end
end