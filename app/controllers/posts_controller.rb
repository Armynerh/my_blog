class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_user, only: %i[new create]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Failed to create the post.'
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
