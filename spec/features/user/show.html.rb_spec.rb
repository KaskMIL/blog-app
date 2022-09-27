require 'rails_helper'

RSpec.describe 'user_path' do
  before(:each) do
    @first_user = User.create(name: 'Tom')
    @second_user = User.create(name: 'Lilly')
    @first_post = Post.create(title: 'Test post 1', text: 'Test post 1', author: @first_user)
    @second_post = Post.create(title: 'Test post 2', text: 'Test post 2', author: @first_user)
    @third_post = Post.create(title: 'Test post 3', text: 'Test post 3', author: @first_user)
  end

  describe 'user profile' do
    it 'should see profile picture first user' do
      visit user_path(@first_user)
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end
    it 'should see profile picture first user' do
      visit user_path(@second_user)
      expect(page).to have_css("img[src*='#{@second_user.photo}']")
    end

    it 'should see users name' do
      visit user_path(@first_user)
      expect(page).to have_content(@first_user.name)
    end
    it 'should see users name' do
      visit user_path(@second_user)
      expect(page).to have_content(@second_user.name)
    end

    it 'should see number of posts' do
      visit user_path(@first_user)
      expect(page).to have_content(@first_user.postCounter)
    end
    it 'should see number of posts' do
      visit user_path(@second_user)
      expect(page).to have_content(@second_user.postCounter)
    end

    it 'should see users Bio' do
      visit user_path(@first_user)
      expect(page).to have_content('Bio')
    end
    it 'should see users Bio' do
      visit user_path(@second_user)
      expect(page).to have_content('Bio')
    end

    it 'should see the user first three posts' do
      visit user_path(@first_user)
      expect(page).to have_content('Test post 1')
      expect(page).to have_content('Test post 2')
      expect(page).to have_content('Test post 3')
    end

    it 'should see a button to see all posts' do
      visit user_path(@first_user)
      expect(page).to have_button('See all posts')
    end

    it 'should redirect to the posts#index page when click see all buttons' do
      visit user_path(@first_user)
      find('a[id= all-posts]').click
      expect(current_path).to eq(user_posts_path(@first_user))
    end
  end
end
