class Merchant::BulkDiscountsController < Merchant::BaseController
  before_action :set_discount, only: [:show, :destroy, :edit]
  def index
    @discounts = @merchant.bulk_discounts
  end

  def show

  end

  def new
    @new_discount = @merchant.bulk_discounts.new
  end

  def create
    new_discount = @merchant.bulk_discounts.new(bulk_discount_params)
    new_discount.save
    flash.notice = "New Discount Added"
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  def destroy
    @discount.destroy
    flash.notice = "Discount deleted"
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  def edit

  end

  private

  def bulk_discount_params
    params.require(:bulk_discount).permit(
      :discount_percent, 
      :quantity_threshold
    )
  end

  def set_discount
    @discount = BulkDiscount.find(params[:id])
  end
end