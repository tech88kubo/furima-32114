class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :prefectures_id, :municipality, :address, :building_name, :record, :user, :item

  with_options presence: true do
    validates :postal_code
    validates :phone_number
    validates :prefectures_id
    validates :municipality
    validates :address
  end

  def save
    Address.create(postal_code: postal_code, phone_number: phone_number, prefectures_id: prefectures_id, municipality: municipality, address: address building_name: building_name, record: record)
    Record.create(user: user, item: item)
  end
end