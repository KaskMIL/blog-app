class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = current_user
    @post = Post.new(post_parameters)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved successfully!'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Please, fill all the fields.'
      render :new, status: 422
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
