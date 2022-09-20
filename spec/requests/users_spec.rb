require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Index' do
    before(:example) { get root_path }

    it 'Should get a success response' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'Show' do
    before(:example) { get '/users/show' }

    it 'Should get a success response' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render show template' do
      expect(response).to render_template('show')
    end
  end
end