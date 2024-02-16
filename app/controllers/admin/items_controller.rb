class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
     @item = Item.new
  end
  
  def create
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
  end
end
