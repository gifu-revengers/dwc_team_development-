class Admin::OrderListsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.status = params[:order_detail_status]
    order_detail.save
    #注文のステータスを更新
    @order_details = OrderDetail.where(order_id: order_detail.order_id)
    @order = Order.find(order_detail.order_id)
    if order_detail.status == "製作中"
      @order.status = "製作中"
      @order.save
    elsif order_detail.status == "製作完了"
      @order.status = "発送準備中"
      @order_details.each do |detail|
        @order.status = "製作中" unless detail.status == "製作完了"
      end
      @order.save
    end
  end

end
