require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    it 'すべての情報が正しく入力された場合は保存できる' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空の場合は保存できない' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end
    it '郵便番号にハイフンがない場合は保存できない' do
      @purchase_address.postal_code = '1112222'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it '郵便番号の桁数が適切ではない場合は保存できない' do
      @purchase_address.postal_code = '11111-12222'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is too long (maximum is 8 characters)')
    end
    it '都道府県が空の場合は保存できない' do
      @purchase_address.prefectures_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank", 'Prefectures is invalid')
    end
    it '都道府県が0の場合は保存できない' do
      @purchase_address.prefectures_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefectures is invalid')
    end
    it '市区町村が空の場合は保存できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空の場合は保存できない' do
      @purchase_address.number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
    end
    it '電話番号が空の場合は保存できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end
    it '電話番号が９桁未満の場合は保存できない' do
      @purchase_address.phone_number = 12_345_678
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が12桁以上だと保存できない' do
      @purchase_address.phone_number = 123_456_789_123
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it '電話番号にハイフンがある場合は保存できない' do
      @purchase_address.phone_number = "#{123}-#{456}-#{789}"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンが空の場合は保存ができない' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
