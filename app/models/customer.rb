class Customer < ApplicationRecord
    has_many :appointments, dependent: :destroy 
    has_many :barbers, through: :appointments

    validates :name, :age, :location, :email, :password, :cell, presence: true 
    validates :email, :cell, uniqueness: true 

    validates :age, numericality: {greater_than_or_equal_to: 15} 
    validates :cell, length: {is: 10}
end
