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
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
   if @address.update(address_params)
     redirect_to address_path
   else
     render "edit"
   end
  end

  def destroy
    @address.destroy
    redirect_to addres_path
  end

private

def address_params
  params.require(:address).permit(:post_code, :address, :name)
end

end
