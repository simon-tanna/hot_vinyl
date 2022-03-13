class ReviewsController < ApplicationController
    before_action :find_product


    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.product_id = @product.id
        @review.user_id = current_user.id
        
        if @review.save
            redirect_to product_path(@product)
        else
            render 'new'
        end
    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating)
    end

    def find_product
        @product = Product.find(params[:product_id])
    end
end
