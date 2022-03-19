class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :verified_seller, only: [:new, :create, :my_selling_products]
  before_action :owner_or_admin, only: [:edit, :update, :destroy]
  before_action :sold_item, only: [:edit, :update, :destroy]
  before_action :product_sort, only: [:index, :recently_sold]
  # This invokes the helper method created to sort the columns in index and recently sold
  helper_method :sort_column, :sort_direction

  # GET /products or /products.json
  def index
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
    # This checks if the current user has listed any items for sale
    if current_user.products.count < 1
      flash[:alert] = 'You have not listed any items to sell'
      redirect_to new_product_path
    end
  end
  
  # GET method to show all users items that are recently sold in the application
  def recently_sold
    # This checks if there have been any items sold on the site
    @sold_products = Product.all
    if @sold_products.where(sold_status: true).count < 1
      flash[:alert] = 'No Items Have Been Sold'
      redirect_to categories_path
    end
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
  # Allowed params have excluded user_id from being updated.
  # When testing, it was found that the user_id was changed to an editing admin user_id when admin edited a product
  def update
    respond_to do |format|
      if @product.update(params.require(:product).permit(:name, :artist, :price, :category_id, :vinyl_weight, :catalog_number, :condition, :picture))
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

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :artist, :price, :category_id, :vinyl_weight, :catalog_number, :condition, :sold_status, :user_id, :picture)
    end

    # verifying user is a seller before listing new product for sale
    def verified_seller
      if !user_signed_in? or !current_user.seller?
        redirect_to products_url, notice: "You must be registered as a seller to list an item"
      end
    end

    # verifies the user owns a listing or has admin permissions
    def owner_or_admin
      if !current_user.admin? and current_user.id!=@product.user_id
        redirect_to products_url, notice: "You must be the selling user or have administrative access to perform that action"
      end
    end

    # Stops selling user from editing or deleting item if it has been sold
    def sold_item
      if @product.sold_status? == true
        redirect_to product_path, alert: "This item has been sold. You can no longer edit or remove this product"
      end
    end

    # These methods define the parameters used by the sorting helper method
    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    # Before action to invoke sort on index and recently sold
    def product_sort
      @products = Product.order(sort_column + ' ' + sort_direction)
    end

end
