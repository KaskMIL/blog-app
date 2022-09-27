require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom')
    @post = Post.create(author: @user, title: 'title')
    @subject = Comment.create(author: @user, posts: @post, text: 'something')
  end

  it 'Text should not be blank' do
    @subject.text = nil
    expect(@subject).to_not be_valid
  end

  it 'update_counter should add 2 to the post' do
    expect(@post.commentsCounter).to eq 1
  end
end
