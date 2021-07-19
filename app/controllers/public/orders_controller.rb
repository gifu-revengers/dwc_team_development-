class Public::OrdersController < ApplicationController

  def information
    @order=Order.new
    @shipping_address=ShippingAddress.new
  end

  def purchase
    @order=Order.new(order_params)
    @shipping_sel=order_params[:shipping_sel]
    if @shipping_sel == "0"
      @shipping_address=ShippingAddress.new
    elsif @shipping_sel == "1"
      @shipping_address=ShippingAddress.find(order_params[:shipping_address_id])
    else
      @shipping_address=ShippingAddress.new(shipping_address_params[:shipping_address])
      @shipping_address.customer_id=current_customer.id
      render :information if @shipping_address.invalid?
    end
  end

  def create
    # 配送先登録
    @shipping_sel=order_params[:shipping_sel]
    @shipping_addres_id=order_params[:shipping_address_id]
    if @shipping_sel == "2"
      @shipping_address=ShippingAddress.new(shipping_address_params[:shipping_address])
      @shipping_address.customer_id=current_customer.id
      render :information and return if params[:back] || !@shipping_address.save
      @shipping_addres_id=@shipping_address.id
    else
      @shipping_address=ShippingAddress.new
    end
    # オーダー情報登録
    @order = Order.new(order_params)
    @order.total_price = 0
    if @shipping_sel == "0"
      @order.postcode = Customer.find(current_customer.id).postcode
      @order.address = Customer.find(current_customer.id).address
      @order.address_name = Customer.find(current_customer.id).join_name
    else
      @shipping_address=ShippingAddress.find(@shipping_address_id)
      @order.postcode = @shipping_address.postcode
      @order.address = @shipping_address.address
      @order.address_name = @shipping_address.name
    end
    render :information and return if params[:back] || !@order.save
    # オーダー詳細登録
    total_price = 0
    @cart_items=CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      @order_detail=OrderDetail.new
      @order_detail.order_id=@order.id
      @order_detail.item_id=cart_item.item_id
      @order_detail.quantity=cart_item.quantity
      @order_detail.price=Item.find(@order_detail.item_id).price
      @order_detail.save
      cart_item.destroy
      total_price=@order_detail.quantity * @order_detail.price
    end
    #商品合計アップデート
    Order.update(total_price: total_price)
    redirect_to thankyou_orders_path
  end

  def index
  end

  def show
  end

  def thankyou
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:shipping_sel,:shipping_address_id).merge(customer_id: current_customer.id ,postage: 800)
  end

  def shipping_address_params
    params.require(:order).permit(shipping_address:[:postcode, :address, :address_name])
  end

end
