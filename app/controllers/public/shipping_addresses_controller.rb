class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses.all
  end

  def create
    @shipping_addresses = current_customer.shipping_addresses.all
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id

    if @shipping_address.save
      flash[:notice] = "配送先新規登録が完了しました"
     redirect_to request.referer
    else
      @shipping_addresses = current_customer.shipping_addresses.all
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:notice] = "配送先住所の変更が完了しました"
      redirect_to shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @shipping_addresses = current_customer.shipping_addresses.all
    ShippingAddress.find(params[:id]).destroy
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postcode,:address,:address_name)
  end

end