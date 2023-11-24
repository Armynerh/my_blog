# user_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to new_user_session_path, notice: 'Successfully signed out. Please log in.'
    else
      @user = User.find_by(id: params[:id])

      if @user
        @recent_posts = @user.recent_posts
        @all_posts = @user.posts
      else

        redirect_to root_path, alert: 'User not found.'
      end
    end
  end
end
