class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer, notice: "You have created book successfully."
    else
      @addresses = Address.all
      render 'index'
    end

  end

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
