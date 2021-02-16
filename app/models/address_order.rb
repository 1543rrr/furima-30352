class AddressOrder
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :municipality, :address, :address, :phone_number, :order

  validates :postal_code, :prefecture_id, :detail_id, :regarding_delivery_id, :selling_price_id, :category_id, :prefecture_id,
            :value, presence: true
  validates :address, format: { with: /-/}
  validates :phone_number, format: { with: /^0\d{,10}$/}

  def save
    order = Order.create(user_id: user, item_id: item)
    Address.create(postal_code_id: postal_code, prefecture_id: prefecture_id, municipality_id: municipality, address_id: address, building_name_id: building_name, phone_number_id: phone_number, order_id: order.id)
  end
end






