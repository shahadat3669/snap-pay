class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @categories = @user.categories
    @payment = Payment.new
  end
end
