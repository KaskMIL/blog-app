first_user = User.create(name: 'Tom', photo: 'https://api.lorem.space/image/face?w=150&h=150', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://api.lorem.space/image/face?w=150&h=150', bio: 'Teacher from Poland.')

(1..4).each do |i|
  Post.create(author: first_user, title: "my post #{i}", text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
end

first_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

(1..6).each do |i|
  Comment.create(author: first_user, posts: first_post, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.')
end

(1..6).each do |i|
  Like.create(author: second_user, posts: first_post)
end
