class OrdersController < ApplicationController
  before_action :find_product, only: [:new, :create]
  before_action :authenticate_user!

  def index

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(product: @product, user: current_user, price: @product.price)
  end

  private
  # finds product 
  def find_product
    @product = Product.find(params[:product_id])
  end
end
