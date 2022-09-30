require 'swagger_helper'

describe 'User API' do
  path '/api/v1/users' do
    get 'Retrives users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'OK' do
        schema type: :array, items: { '$ref' => '#/components/schemas/User' }
        run_test!
      end
    end
  end
end
