class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end
  
  def update
  #   @order = Order.find(params[:id])
  # if @order.update(order_params)
  #   redirect_to admin_order_path(@order)
  # else
  #   render :show
  # end
  end
end
