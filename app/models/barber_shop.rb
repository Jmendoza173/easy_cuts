class BarberShop < ApplicationRecord
    has_many :barbers 
    has_many :shop_services, dependent: :destroy
    has_many :services, through: :shop_services 

    validates :name, :location, presence: true 
    validates :name, uniqueness: true 
end