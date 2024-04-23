class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    if order.update(order_params)
      # order_details.update_all(making_status: 1) if order.order_status == 1
      order_details.update_all(making_status: "waiting_for_making") if order.order_status == "confirm_payment"
      redirect_to admin_root_path(order)
    else
      render :show
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:order_status)
    end
end
