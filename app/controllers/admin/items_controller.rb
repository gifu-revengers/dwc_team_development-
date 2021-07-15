class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genrus = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_items_path
    end
  end

  def index
     @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name,:caption,:price,:item_image,:is_active,:genre_id)
  end

end
