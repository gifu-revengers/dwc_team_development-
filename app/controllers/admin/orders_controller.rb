class Admin::OrdersController < ApplicationController

  def index
    @orders = Orders.page(params[:page]).reverse_order
  end

  def show
  end

  def update
  end

end
