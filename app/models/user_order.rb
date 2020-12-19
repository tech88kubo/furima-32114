class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :prefectures_id, :municipality, :address, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, phone_number: phone_number, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, record_id: record.id)
  end
end