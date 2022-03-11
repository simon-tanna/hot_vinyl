class OrdersController < ApplicationController
  before_action :find_product, only: [:new, :create]
  before_action :charge_amount, only: [:new, :create]
  before_action :set_description, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create
    # @amount = (@product.price*100).to_i

    
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe Customer', 
      currency: 'aud'
    )


    @order = Order.create(product: @product, user: current_user)
    @product.update(sold_status: true)
    redirect_to orders_index_path, notice: "Congratulatons! You have just purchased #{@product.name}!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  private
  # finds product 
  def find_product
    @product = Product.find(params[:product_id])
  end

  def charge_amount
    @amount = (@product.price*100).to_i
  end

  def set_description
    @description = "#{@product.name} by #{@product.artist}"
  end
end