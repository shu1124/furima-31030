class Item < ApplicationRecord
  extend ActiveHash::Assocations::ActiveRecordExtensions
  belongs_to_active_hash :category, :delivery_date, :delivery_fee, :prefecture, :status

  with_options presence: ture do
    validates :name, length: { maximum: 40}
    validates :text, { maximum: 1000}
    validates :fee, format: {with: /\A[a-zA-Z0-9]+\z/ },
                    length: {minimum: 300, maximum: 9999999}
    validates :image
  end

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :delivery_date_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :status_id
  end

  belongs_to :user
  has_one_attached :image
end
