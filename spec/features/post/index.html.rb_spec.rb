require 'rails_helper'

RSpec.describe 'user_posts_path' do
  before(:each) do
    @first_user = User.create(name: 'Tom')
    @first_post = Post.create(title: 'Test post 1', text: 'Test post 1', author: @first_user)
    @second_post = Post.create(title: 'Test post 2', text: 'Test post 2', author: @first_user)
    @third_post = Post.create(title: 'Test post 3', text: 'Test post 3', author: @first_user)
    @first_comment = Comment.create(text: 'First comment', author: @first_user, posts: @first_post)
  end

  it 'should show users picture' do
    visit user_posts_path(@first_user)
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'should show users name' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'should show number of posts' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.postCounter)
  end

  it 'should show posts titles' do
    visit user_posts_path(@first_user)
    expect(page).to have_content('Test post 1')
    expect(page).to have_content('Test post 2')
    expect(page).to have_content('Test post 3')
  end

  it 'should show first comment' do
    visit user_posts_path(@first_user)
    expect(page).to have_content('First comment')
  end

  it 'should show number of comments' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.commentsCounter)
  end

  it 'should show number of likes' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.likesCounter)
  end

  it 'should redirect to the post show page when click' do
    visit user_posts_path(@first_user)
    find("a[id=#{@first_post.id}]").click
    expect(current_path).to eq(user_post_path(@first_user, @first_post))
  end
end
