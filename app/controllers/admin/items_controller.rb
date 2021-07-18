class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:notice] = "商品の新規登録が完了しました"
     redirect_to admin_items_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
     @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報の更新が完了しました"
      redirect_to admin_items_path
    else
      @genres = Genre.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:caption,:price,:item_image,:is_active,:genre_id)
  end

end