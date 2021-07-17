class Public::OrdersController < ApplicationController

  def information
  end

  def purchase
  end

  def create
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
    #注文商品一覧を作成
    @order_details = []
    @orders.each do |order|
      @order_details.push(order.detail_items)
    end
  end

  def show
  end

  def thankyou
  end

end
