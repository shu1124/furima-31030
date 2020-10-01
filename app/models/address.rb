class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: {with: /^\d{3}-\d{4}$/ }
    validates :city
    validates :number
    validates :phone_number, format: {with: /^0\d{9,11}$/}
  end
  belongs_to :purchase

end
