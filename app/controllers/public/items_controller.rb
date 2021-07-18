class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    search = params[:search_word]
    genre = params[:genre]
    if search
      @items = Item.where(['name like(?)', "%#{search}%"]).page(params[:page]).per(10)
      @title = search
    elsif genre
      @items = Item.where(genre_id: genre).page(params[:page]).per(10)
      @title = Genre.find(genre).name
    else
      @items = Item.page(params[:page]).per(10)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
