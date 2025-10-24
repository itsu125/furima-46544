class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :token, :city, :street_address
    validates :post_code, format: {
      with: /\A\d{3}-\d{4}\z/,
      message: 'is invalid. Enter it as follows (e.g. 123-4567)'
    }
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/,
      message: 'is invalid. Input only number'
    }
  end

  validates :prefecture_id, numericality: {
    other_than: 1,
    message: "can't be blank"
  }

  validates :phone_number, length: {
    minimum: 10,
    maximum: 11,
    message: 'is too short'
  }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
