class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :email, :is_active)
  end
  
end
