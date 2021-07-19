class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    search = params[:search_word]
    genre = params[:genre]
    if search
      search_words = search.split(/[[:blank:]]+/)
      items = []
      search_words.each do |search_word|
        next if search_word == ""
        items += Item.where(['name like(?)', "%#{search_word}%"])
      end
      items.uniq!
      @items = Kaminari.paginate_array(items).page(params[:page]).per(10)
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
    if current_customer.item_include?(@item)
      @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
    else
      @cart_item = CartItem.new
    end
  end

end
