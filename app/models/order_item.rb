class OrderItem
  include ActiveModel::Model 
  attr_accessor :postal_code,:city,:area,:building,:prefecture_id,:phone_number, :item_id, :user_id,:token

  with_options presence: true do
    validates :token
    validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality:{other_than: 1,message: "can't be blank"}
    validates :phone_number, format:{with: /\A\d{11}\z/, message:"Input only number"}
    validates :city
    validates :area
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, area: area, building: building,prefecture_id: prefecture_id, phone_number: phone_number, item_id: order.item_id)
  end

end
