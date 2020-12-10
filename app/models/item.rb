class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :days_to_ship
  belongs_to :prefectures

  with_options presence:true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_charges_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/i, message: "is invalid. Input number."}
  end
    validates :image
  end
end
