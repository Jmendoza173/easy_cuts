class ShopService < ApplicationRecord
  belongs_to :barber_shop
  belongs_to :service
end
