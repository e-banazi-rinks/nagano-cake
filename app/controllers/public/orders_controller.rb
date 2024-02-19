class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = Address.all #注文情報入力画面に表示させるのに使う
  end

  def index
  end

  def show
  end
  
  def confirm
  end

  def thanks
  end
end
