class Customer < ApplicationRecord

    has_secure_password

    has_many :appointments, dependent: :destroy
    has_many :barbers, through: :appointments

    validates :name, :age, :location, :email, :password, :cell, presence: true
    validates :email, :cell, uniqueness: true

    validates :age, numericality: {greater_than_or_equal_to: 15}
    validates :cell, length: {is: 10}


    def self.authenticate(email, password)
      if customer && customer.authenticate(params[:password])
          session[:customer] = customer.id
          redirect_to customer_path(customer.id)
      else
          flash[:errors] = ["Either your Email or Password are incorrect."]
          redirect_to log_in_path
      end
    end

end
