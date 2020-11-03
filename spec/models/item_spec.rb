require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '投稿がうまく行く時' do
    it '全ての項目が記入されている' do
      expect(@item).to be_valid
    end
  end

  context '投稿がうまく行かない時' do
    it '画像が添付されていない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が記入されていない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がが記入されていない' do
      @item.content = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it 'カテゴリーがチェックされていない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態がチェックされていない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it '配送元がチェックされていない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area Select')
    end
    it '配送までの日数がチェックされていない' do
      @item.send_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Send Select')
    end
    it '金額が入力されていない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '金額が300円以下' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price out of setting range')
    end
    it '金額が9999999円以上' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price out of setting range')
    end
    it '金額が半角英数字以外で入力されている' do
      @item.price = '１２３３'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price half-width number')
    end
  end
end
