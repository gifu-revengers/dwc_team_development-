class Public::ItemsController < ApplicationController

  def index
    @genre = params[:sort]
    if @genre
      @items = Item.where(genre_id: @genre).page(params[:page]).per(10)
    else
      @items = Item.page(params[:page]).per(10)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
