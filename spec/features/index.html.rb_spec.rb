require 'rails_helper'

RSpec.describe 'users_path', type: :feature do
  describe 'root path' do
    it 'should display all users names' do
      visit root_path
      expect(page).to have_content(User.first.name)
      expect(page).to have_content(User.last.name)
    end
    it 'shows profile picture' do
      visit root_path
      expect(page).to have_css("img[src*='#{User.first.photo}']")
      expect(page).to have_css("img[src*='#{User.last.photo}']")
    end
    it 'Shows the number of posts each user has' do
      visit root_path
      expect(page).to have_content(User.first.postCounter)
      expect(page).to have_content(User.last.postCounter)
    end
    it 'Should redirect to first user_path' do
      visit root_path
      find("a[id=#{User.first.id}]").click
      expect(current_path).to eq(user_path(User.first))
    end
    it 'should redirects to last user_path' do
      visit root_path
      find("a[id=#{User.last.id}]").click
      expect(current_path).to eq(user_path(User.last))
    end
  end
end
