# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'test', bio: 'test')
(1..4).each do |i|
  Post.create(author: first_user, title: "my post #{i}", text: "my text #{i}")
end

first_post = Post.first

(1..6).each do |i|
  Comment.create(author: first_user, posts: first_post, text: "my comment #{i}")
end
