class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid.' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ン]/, message: 'is invalid.' } do
      validates :family_kana
      validates :first_kana
    end
    validates :date
  end

  has_many :items
end
