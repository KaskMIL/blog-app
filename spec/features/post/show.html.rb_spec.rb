require 'rails_helper'

RSpec.describe 'user_post_path' do
  before(:each) do
    @first_user = User.create(name: 'Tom')
    @first_post = Post.create(title: 'Test post 1', text: 'Test post 1', author: @first_user)
    @first_comment = Comment.create(text: 'First comment', author: @first_user, posts: @first_post)
  end

  it 'should show post title' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.title)
  end

  it 'should show posts owner' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_user.name)
  end

  it 'should show how many comments it has' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.commentsCounter)
  end

  it 'should show how many likes it has' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.likesCounter)
  end

  it 'should show post body' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.text)
  end

  it 'should show name of the commentor' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_comment.author.name)
  end

  it 'should show the comment' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_comment.text)
  end
end
