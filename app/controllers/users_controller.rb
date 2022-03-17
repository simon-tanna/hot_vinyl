class UsersController < ApplicationController
  before_action :set_user_profile
  # Renders user profile on page
  def profile_view
  end

  private

  def set_user_profile
    @user = User.find(params[:id])
    @products = @user.products
  end

end
