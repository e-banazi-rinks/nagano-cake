class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(params_cart_item)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, :new_amount)
        @cart_item.delete
      else
        cart_item.save
        redirect_to cart_items_path
      end
    end
  end

  def index
    @cart_items = CartItem.all
  end
  
  def destroy
    current_user.cart_items.destroy_all
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:amount, :item_id,)
  end

end
