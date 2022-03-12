class OrdersController < ApplicationController
  before_action :find_product, only: [:new, :create]
  before_action :charge_amount, only: [:new, :create]
  before_action :set_description, only: [:new, :create]
  before_action :authenticate_user!
  before_action :is_owner, only: [:new, :create]

  # Displays the orders placed by the current user.
  # The user will be redirected to products/index if they have not placed any orders
  def index
    @orders = current_user.orders

    if current_user.orders.count < 1
      flash[:alert] = 'You have no order history to display'
      redirect_to products_url
    end

  end

  # GET for orders/new
  def new
    @order = Order.new
  end

  # POST for orders with payment using stripe
  def create

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


    @order = Order.create(product: @product, user: current_user, receipt_url: charge.receipt_url)
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

  # converts payment amount to integer
  def charge_amount
    @amount = (@product.price*100).to_i
  end

  # passes in description of product to allowed methods
  def set_description
    @description = "#{@product.name} by #{@product.artist}"
  end

  # Stops seller from buying own product
  def is_owner
    if @product.user_id == current_user.id
      redirect_to products_url, alert: "You cannot purchase your own product!"
    end
  end
end