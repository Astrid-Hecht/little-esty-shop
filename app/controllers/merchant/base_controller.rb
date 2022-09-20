class Merchant::BaseController < ApplicationController
  before_action :set_merchant, only: [:index, :show, :create]

private
  def set_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end
end