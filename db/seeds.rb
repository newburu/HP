# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Account.create!(
  email: "lilyko14@gmail.com",
  password: "hcRnZ0Kh029pUo86z0lMXwaxafYPcldu"
)
2.times do |i|
  Article.create!(
    thumbnail: "https://thumb.photo-ac.com/2d/2d12c0da978d4c5c8a3db90ed7113add_t.jpeg",
    status: "published",
    title: "タイトル#{i}",
    body: "本文#{i}が入ります。",
    created_at: "2022/9/#{i}"
  )
end

3.times do |i|
  Article.create!(
    thumbnail: "https://thumb.photo-ac.com/2d/2d12c0da978d4c5c8a3db90ed7113add_t.jpeg",
    status: "published",
    title: "タイトル#{i}",
    body: "本文#{i}が入ります。",
    created_at: "2022/10/#{i}"
  )
end

5.times do |i|
  Article.create!(
    thumbnail: "https://thumb.photo-ac.com/2d/2d12c0da978d4c5c8a3db90ed7113add_t.jpeg",
    status: "published",
    title: "タイトル#{i}",
    body: "本文#{i}が入ります。",
    created_at: "2022/11/#{i}"
  )
end
