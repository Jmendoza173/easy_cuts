class Barber < ApplicationRecord
  belongs_to :barber_shop
  belongs_to :service
  has_many :appointments, dependent: :destroy
  has_many :customers, through: :appointments

  validates :name, :accept_card, :accept_cash,:email, :password, :cell, presence: true
  validates :email, :cell, uniqueness: true 
  validates :cell, length: {is: 10}
end
