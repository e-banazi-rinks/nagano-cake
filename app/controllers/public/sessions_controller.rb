# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :reject_customer, only: [:create]
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  
  private
  
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_active
        redirect_to new_customer_registration_path
      end
    end
  end
  
  # return unless customer.is_active?
  # def customer_state
    # @customer = customer.find_by(email: params[:user][:email])
    # if @customer
      # if @customer.valid_password?(params[:user][:password]) && !@customer.is_active
        # redirect_to new_customer_session_path
      # end
    # end
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
