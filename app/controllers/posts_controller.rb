# posts_controller.rb
class PostsController < ApplicationController
  before_action :current_user, only: %i[new create]
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Failed to create the post.'
      Rails.logger.debug @post.errors.inspect
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
