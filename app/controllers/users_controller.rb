class UsersController < ApplicationController
  def index
    @users = User.all
    puts User.find(2).postCounter
  end

  def show
    @user = User.find(params[:id])
    @last_posts = @user.recent_post
  end
end
