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

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charges_id
      validates :days_to_ship_id
      validates :prefectures_id
    end

    validates :price, format: { with: /\A[0-9]+\z/i, message: "is invalid. Input number."}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image, unless: :was_attached?
  end

  def was_attached?
    self.image.attached?
  end
end
