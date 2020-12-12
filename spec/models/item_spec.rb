require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいきとき' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が入力されているとき登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品がうまくいかないとき' do
      it '出品画像が添付されていない場合出品できない' do
      end
      it '商品名が入力されていない場合出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank") 
      end
      it '商品の説明が入力されていない場合出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank") 
      end
      it '商品のカテゴリーが入力されていない場合出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態が入力されていない場合出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end
      it '配送料の負担が入力されていない場合出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank", "Shipping charges is not a number")
      end
      it '発送元の地域が入力されていない場合出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
      end
      it '発送までの日数が入力されていない場合出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", "Days to ship is not a number")
      end
      it '販売価格が入力されていない場合出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input number.")
      end
    end
  end
end
