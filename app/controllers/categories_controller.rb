class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_category, {only: [:show, :edit, :update, :destroy] }
  # before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action(:authorize, {only: [:edit, :destroy, :update] })

  def index
    @categories = Category.all
  end

  def show
    @product = Product.new
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  # def find_product
  #   @product = Product.find params[:id]
  # end

  def category_params
    params.require(:category).permit(:name)
  end

  def authorize
    if cannot?(:manage, @category)
      redirect_to root_path, alert: 'Not authorized!'
      # redirect_to edit_post_path
    end
  end
end
