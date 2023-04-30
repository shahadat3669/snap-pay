class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @categories = @user.categories
    @category = @user.categories.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @user = current_user
    @payment = @user.payments.build(payment_params)
    @category = @user.categories.find(@payment.categories.first.id)

    if @payment.save
      redirect_to category_path(@category), notice: 'Payment was successfully created.'
    else
      @categories = @user.categories
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
