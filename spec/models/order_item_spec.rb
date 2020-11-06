require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @order_item = FactoryBot.build(:order_item)
  end

  describe '購入がうまく行く時' do
    context '新規登録がうまく行く時' do
      it '全ての項目が正しく入力されている' do
         expect(@order_item).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_item.building = ""
        expect(@order_item).to be_valid
     end
     
    end

    context '購入がうまく行かない時' do
      it 'カード番号が情報が登録されていない' do
        @order_item.token = ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空' do
        @order_item.postal_code = ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない' do
        @order_item.postal_code = "1111111"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角ではない' do
        @order_item.postal_code = "１１１−１１１１"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が空' do
        @order_item.prefecture_id = 1
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空' do
        @order_item.city = ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空' do
        @order_item.area = ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Area can't be blank")
      end

      it '電話番号が空' do
        @order_item.phone_number = ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が数字以外' do
        @order_item.phone_number = "１１１１１１１１１１１"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number Input only number")
      end
      it '' do
      end
    end
  end
end
