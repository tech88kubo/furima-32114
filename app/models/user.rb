class User < ApplicationRecord
  has_many :items
  has_many :records
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence:true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."}
    validates :last_name, format:  { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."}
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :last_kana, format:  { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birthday
    validates :password, format:   { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width characters."}
  end
end
