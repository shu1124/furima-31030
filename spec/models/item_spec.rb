require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能のテスト' do
    it 'すべて適切に入力した場合は出品できる' do
      expect(@item).to be_valid
    end
    it '商品名が空の場合はエラー' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の画像がない場合はエラー' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品の説明がない場合はエラー' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリー情報がない場合はエラー' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is invalid.')
    end
    it '商品状態についての情報がない場合はエラー' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is invalid.')
    end
    it '配送料負担の情報がない場合はエラー' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee is invalid.')
    end
    it '発送元地域の情報がない場合はエラー' do
      @item.prefectures_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefectures is invalid.')
    end
    it '発送までの日数の情報がない場合はエラー' do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date is invalid.')
    end
    it '価格が空の場合はエラー' do
      @item.fee = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end
    it '価格が300以下の場合はエラー' do
      @item.fee = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee must be greater than 300')
    end
    it '価格が9999999以上の場合はエラー' do
      @item.fee = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee must be less than 9999999')
    end
    it '販売価格に半角英数字以外があるとエラー' do
      @item.fee = '110o0'
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee is not a number')
    end
  end
end
