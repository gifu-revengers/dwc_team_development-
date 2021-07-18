class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_addresses = current_customer.shipping_addresses.all
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
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