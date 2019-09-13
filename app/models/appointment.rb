class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :barber

  validates :date, :time, presence: true
  validates :date, uniqueness: {scope: :customer_id}

end
