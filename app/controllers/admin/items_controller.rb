class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
     @item = Item.new
     @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
  if @item.save
    redirect_to admin_items_path
  else
    @genres = Genre.all # 追加
    render :new
  end
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to admin_items_path
  else
    @genres = Genre.all
    render :edit
  end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :status, :image,:genre_id)
  end
end
