class ReviewsController < ApplicationController
    before_action :find_product
    before_action :find_review, only: [:edit, :update, :destroy]
    before_action :owner_or_admin, only: [:edit, :update, :destroy]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.product_id = @product.id
        @review.user_id = current_user.id
        
        if @review.save
            redirect_to product_path(@product), notice: 'You have posted a review for your purchase!'
        else
            render 'new'
        end
    end

    def edit
    end

    def update

        if @review.update(review_params)
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating)
    end

    def find_product
        @product = Product.find(params[:product_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def owner_or_admin
        if !current_user.admin? and current_user.id!=@review.user_id
          redirect_to products_url, notice: "You must be the review owner or have administrative access to perform that action"
        end
    end
end
