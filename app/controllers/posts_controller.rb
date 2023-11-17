# posts_controller.rb
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end
end
