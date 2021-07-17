class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
  end

  def update
  end

  def quit_confirm
  end

  def quit
  end

end
