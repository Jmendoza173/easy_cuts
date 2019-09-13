class Service < ApplicationRecord
    # has_many :barbers 
    has_many :shop_services, dependent: :destroy
    has_many :barber_shops, through: :shop_services 

    validates :hair,:shape_up,:facial,:facial_hair,:extra, uniqueness: true
end
