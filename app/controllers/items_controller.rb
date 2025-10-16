class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :price,
      :category_id, :condition_id, :shipping_fee_id,
      :prefecture_id, :shipping_day_id,
      :image
    )
  end

end
