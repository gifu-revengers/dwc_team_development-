class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @genre = params[:sort]
    if @genre
      @items = Item.where(genre_id: @genre).page(params[:page]).per(10)
    else
      @items = Item.page(params[:page]).per(10)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    if current_customer.item_include?(@item)
      @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
    else
      @cart_item = CartItem.new
    end
  end

end
