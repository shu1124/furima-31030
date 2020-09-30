class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :delivery_date 
  belongs_to_active_hash :delivery_fee 
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  with_options presence: true do
    validates :name, length: { maximum: 40}
    validates :text, length: { maximum: 1000}
    validates :fee, numericality:{ only_integer: true,greater_than: 300, less_than: 9999999}
    validates :image
  end

  with_options numericality: {other_than: 0, message: 'is invalid.'} do
    validates :category_id
    validates :delivery_date_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :status_id
  end

  belongs_to :user
  has_one_attached :image
end
