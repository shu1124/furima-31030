class Item < ApplicationRecord
  extend ActiveHash::Assocations::ActiveRecordExtensions
  belongs_to_active_hash :category, :delivery_date, :delivery_fee, :prefecture, :status

  with_options presence: ture do
    validates :name
    validates :text
    validates :fee
  end

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :delivery_date_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :status_id
  end

  belongs_to :user
end
