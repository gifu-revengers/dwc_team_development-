class Admin::CustomersController < ApplicationController

  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="会員情報を更新しました"
      redirect_to admin_customer_path(@customer.id)
    else
      render "admin/customers/edit"
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :email, :phone_number, :is_deleted)
  end

end
