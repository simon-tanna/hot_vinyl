class OrdersController < ApplicationController
  before_action :find_product, only: [:new, :create]
  before_action :charge_amount, only: [:new, :create]
  before_action :set_description, only: [:new, :create]
  before_action :authenticate_user!

  def index

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

    # This is imported from the stripe tool module located in model/concerns
    # customer = StripeTool.create_customer(email: params[:stripeEmail], stripe_token: params[:stripeToken])
    
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe Customer', 
      currency: 'aud'
    )

    # This is imported from the stripe tool module located in model/concerns
    # charge = StripeTool.create_charge(customer_id: customer_id, amount: @amount, description: 'Rails Stripe Customer')

    @order = Order.create(product: @product, user: current_user)
    @product.update(sold_status: true)
    redirect_to orders_index_path
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