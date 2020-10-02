class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:postal_code, :city, :number,:phone_number,:prefectures_id,:token, :building

  with_options presence: true do
    validates :postal_code, format: {with: /\d{3}-\d{4}/ }
    validates :city
    validates :number
    validates :phone_number, format: {with: /[0-9]{9,11}/}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, number: number, building: building,phone_number: phone_number , prefectures_id: prefectures_id, purchase_id: purchase.id) 
  end
end