require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end
  describe '商品出品機能' do
    it '全て正常' do
      expect(@item).to be_valid
    end

    it 'imageが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリーのidが０以外であること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it '商品の状態についての情報が必須であること' do
      @item.detail_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.selling_price_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.regarding_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Regarding delivery can't be blank")
    end

    it '価格についての情報が必須であること' do
      @item.value = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Value can't be blank")
    end

    it '価格の範囲が、¥299円以下では出品できないこと' do
      @item.value = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Value This site is only for under 300 and over 9,999,999')
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.value = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Value This site is only for under 300 and over 9,999,999')
    end

    it '販売価格は全角数字では登録できないこと' do
      @item.value = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Value is not a number')
    end

    it '販売価格は半角英数混合では登録できないこと' do
      @item.value = '3rt'
      @item.valid?
      expect(@item.errors.full_messages).to include('Value is not a number')
    end

    it '販売価格は半角英語だけでは登録できないこと' do
      @item.value = 'wer'
      @item.valid?
      expect(@item.errors.full_messages).to include('Value is not a number')
    end
  end
end
