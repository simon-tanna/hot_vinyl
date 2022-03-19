class UsersController < ApplicationController
  before_action :set_user_profile
  helper_method :sort_column, :sort_direction
  # Renders user profile on page
  def show
  end

  private
  # Displays profile of linked user 
  def set_user_profile
    @user = User.find(params[:id])
    @products = @user.products.order(sort_column + ' ' + sort_direction)
  end

  # These methods define the parameters used by the sorting helper method
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
  
end
