class Customer < ApplicationRecord
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :age, presence: true
end
