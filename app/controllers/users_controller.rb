# user_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      # Handle sign out logic here (redirect to the appropriate path, destroy session, etc.)
      # Example:
      sign_out current_user
      redirect_to root_path, notice: 'Successfully signed out.'
    else
      # Check if the 'id' parameter is a valid integer
      @user = User.find_by(id: params[:id])

      if @user
        @recent_posts = @user.recent_posts
        @all_posts = @user.posts
      else
        # Handle the case where the user is not found
        redirect_to root_path, alert: 'User not found.'
      end
    end
  end
end
