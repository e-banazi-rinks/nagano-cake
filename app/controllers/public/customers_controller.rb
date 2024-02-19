class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end
  
  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end
  
  def withdraw
    @customer = Customer.find_by(email: params[:email])
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
end
