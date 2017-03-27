class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action(:authorize, {only: [:edit, :destroy, :update] })

  def search
    if params[:search].present?
      @products = Product.search(params[:search])
    else
      @products = Product.all
    end    
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id

    @review   = Review.new
    @reviews  = @product.reviews

    if @review.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    # @product.user = current_user

    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product successfully deleted!'
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    product_params = params.require(:product).permit(:title,
                                                     :description,
                                                     :price,
                                                     :category_id)
  end

  def authorize
    if cannot?(:manage, @product)
      redirect_to root_path, alert: 'Not authorized!'
      # redirect_to edit_post_path
    end
  end

end
