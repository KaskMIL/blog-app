require 'rails_helper'

RSpec.describe 'users_path', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom')
    @second_user = User.create(name: 'Lilly')
  end

  describe 'root path' do
    it 'should display all users names' do
      visit root_path
      expect(page).to have_content(@first_user.name)
      expect(page).to have_content(@second_user.name)
    end
    it 'shows profile picture' do
      visit root_path
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
      expect(page).to have_css("img[src*='#{@second_user.photo}']")
    end
    it 'Shows the number of posts each user has' do
      visit root_path
      expect(page).to have_content(@first_user.postCounter)
      expect(page).to have_content(@second_user.postCounter)
    end
    it 'Should redirect to first user_path' do
      visit root_path
      find("a[id=#{User.first.id}]").click
      expect(current_path).to eq(user_path(@first_user))
    end
    it 'should redirects to last user_path' do
      visit root_path
      find("a[id=#{User.last.id}]").click
      expect(current_path).to eq(user_path(@second_user))
    end
  end
end
