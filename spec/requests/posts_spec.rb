require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom')
    @id = @user.id
  end

  describe 'Index' do
    before(:example) { get "/users/#{@id}/posts" }

    it 'Should get a success response' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render posts#index template' do
      expect(response).to render_template('index')
    end
  end
end
