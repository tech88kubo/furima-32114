require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_order.postal_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)") 
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)") 
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.") 
      end
      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        @user_order.phone_number = "090-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid.") 
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @user_order.phone_number = "090123456789"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid.") 
      end

      it 'prefectures_idを選択していないと保存できないこと' do
        @user_order.prefectures_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number") 
      end

      it 'municipalityが空だと保存できないこと' do
        @user_order.municipality = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank") 
      end

      it 'addressが空だと保存できないこと' do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank") 
      end

      it 'building_nameは空でも保存できること' do
        @user_order.building_name = ""
        expect(@user_order).to be_valid
      end

      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end