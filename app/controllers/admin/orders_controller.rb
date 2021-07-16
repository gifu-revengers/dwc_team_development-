class Admin::OrdersController < ApplicationController

  def index
    if customer_id = params[:customer_id]
      @orders = Order.where(customer_id: customer_id).page(params[:page]).reverse_order
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order_status]
    @order.save
    @order_details = OrderDetail.where(order_id: @order.id)
    #注文詳細の製作ステータスを更新
    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.status = "製作待ち"
        order_detail.save
      end
    end
  end

end
