require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get id' do
    get users_id_url
    assert_response :success
  end

  test 'should get posts' do
    get users_posts_url
    assert_response :success
  end

  test 'should get post_id' do
    get users_post_id_url
    assert_response :success
  end
end
