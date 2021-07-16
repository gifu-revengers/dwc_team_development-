class Admin::OrdersController < ApplicationController

  def index
    if customer_id = params[:customer_id]
      @orders = Order.where(customer_id: customer_id).page(params[:page]).reverse_order
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end

  def show
  end

  def update
  end

end
