class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # Only allows users with admin access to create, edit or destroy a category
  before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]
  # Checks if category has active products listed before deletion
  before_action :category_has_products, only: [:destroy]
  # Before action to display categories in index and category list
  before_action :all_categories, only: [:index, :category_list]
  # GET /categories or /categories.json
  def index
  end

  # GET /categories/1 or /categories/1.json
  def show
    # Handles redirect if no products are present in selected category
    if @category_products.count == 0
      flash[:alert] = 'No Items Are Currently Listed In This Category'
      redirect_to categories_path
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
  end

  # Displays full category list
  def category_list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @category_products = Product.where("category_id = #{@category.id}")
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
    # Only allows users with admin access to create, edit or destroy a category
    def is_admin
      if !current_user.admin?
        redirect_to categories_url, notice: "Must be an administrator to perform that action!"
      end
    end

    # Checks if category has active products listed before deletion
    def category_has_products
      if @category.products.count > 0
        redirect_to categories_url, alert: "This category has active listings. You can only delete an empty category"
      end
    end

    # Before action to display categories in index and category list
    def all_categories
      @categories = Category.all
    end
end
