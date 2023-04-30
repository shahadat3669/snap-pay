class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = @user.categories
  end

  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
