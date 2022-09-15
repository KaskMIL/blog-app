first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

(1..4).each do |i|
  Post.create(author: first_user, title: "my post #{i}", text: "my text #{i}")
end

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

(1..6).each do |i|
  Comment.create(author: first_user, posts: first_post, text: "my comment #{i}")
end
