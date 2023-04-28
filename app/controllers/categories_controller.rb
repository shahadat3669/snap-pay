class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = @user.categories
  end

  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
    @payments = @category.payments
  end

  def new
    @category = Category.new
  end
end
