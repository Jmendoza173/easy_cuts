class Customer < ApplicationRecord
    has_many :appointments, dependent: :destroy 
    has_many :barbers, through: :appointments

    has_secure_password

    validates :name, :age, :location, :email, :password, :cell, presence: true, on: :create
    validates :email, :cell, uniqueness: true
    # validates :password, confirmation: true
    # validates :password, confirmation: { case_sensitive: true }
    # validates :password_confirmation, presence: trues
    validates :age, numericality: {greater_than_or_equal_to: 15} 
    validates :cell, length: {is: 10}


end
