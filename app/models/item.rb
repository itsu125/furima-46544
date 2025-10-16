class Item < ApplicationRecord
  validates :name, :description, :category_id, :condition_id, 
  :shipping_fee_id, :prefecture_id, :shipping_day_id, presence: true
  validates :price, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999,
                    }
end
