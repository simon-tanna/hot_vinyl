class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :verified_seller, only: [:new, :create, :my_selling_products]
  before_action :owner_or_admin, only: [:edit, :update, :destroy]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET search method for search function in navbar
  # Search parameters will be for album and artist
  def search
    if params[:search].blank?
      redirect_to(products_path, alert: "You didn't enter anything to search!") and return
    else
      @parameter = params[:search].downcase
      @find_album = Product.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").or(Product.all.where("lower(artist) LIKE :search", search: "%#{@parameter}%"))
    end
  end

  # GET method to show seller list of items they have listed for sale
  def my_selling_products
    @products = current_user.products
  end
  
  def recently_sold
    @products = Product.order(params[:sort] + ' ' + params[:direction])
  end
  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # def find_review
    #   @review = Review.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :artist, :price, :category_id, :vinyl_weight, :catalog_number, :condition, :user_id, :picture)
    end

    # verifying user is a seller before listing new product for sale
    def verified_seller
      if !current_user.seller?
        redirect_to products_url, notice: "You must be registered as a seller to list an item"
      end
    end

    # verifies the user owns a listing or has admin permissions
    def owner_or_admin
      if !current_user.admin? and current_user.id!=@product.user_id
        redirect_to products_url, notice: "You must be the selling user or have administrative access to perform that action"
      end
    end

end
