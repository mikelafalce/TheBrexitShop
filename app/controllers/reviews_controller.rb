class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action(:find_product, {only: [:show, :edit, :destroy, :update] })
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action(:authorize, {only: [:edit, :destroy, :update] })

  def create
    @review           = Review.new review_params

    @product          = Product.find params[:product_id]
    @review.product   = @product
    @review.user      = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      flash[:alert] = 'Please fix errors below'
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review   = Review.find params[:id]
    @product  = @review.product

    @review.destroy
      redirect_to product_path(@review.product_id), notice: 'Review was successfully deleted.'
  end

  private

    def find_review
      @review = Review.find(params[:id])
    end

    def find_product
      @product = Product.find(params[:product_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def authorize
      if cannot?(:manage, @review)
        redirect_to root_path, alert: 'Not authorized!'
        # redirect_to edit_post_path
      end
    end

end
