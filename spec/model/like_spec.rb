require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom')
    @post = Post.create(author: @user, title: 'title')
    @subject = Like.create(author: @user, posts: @post)
  end

  it 'likeCounter in Post should be 1' do
    expect(@subject.posts.likesCounter).to eq 1
  end
end
