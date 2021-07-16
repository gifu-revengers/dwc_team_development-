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
  end

end
