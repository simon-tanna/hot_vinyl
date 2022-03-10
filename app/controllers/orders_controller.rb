class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @order = Order.new
  end

  def create

  end
end
