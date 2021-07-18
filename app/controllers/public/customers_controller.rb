class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice]="会員情報を更新しました"
      redirect_to customers_path
    else
      render "edit"
    end
  end

  def quit_confirm
  end

  def quit
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted)
    end

end
