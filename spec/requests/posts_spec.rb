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
    it 'response body should contain a h1 tag' do
      expect(response.body).to include('<h1>Show posts by user</h1>')
    end
  end

  describe 'Show' do
    before(:example) do
      post = Post.create(title: 'Test post', text: 'Test post', author: @user)
      get "/users/#{@id}/posts/#{post.id}"
    end

    it 'Should get a success response' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render posts#show template' do
      expect(response).to render_template('show')
    end
    it 'response body should contain a h1 tag' do
      expect(response.body).to include('<h1>Show a complete post by id</h1>')
    end
  end
end
