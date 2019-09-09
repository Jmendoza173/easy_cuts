class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :customer
  belongs_to :barber

  validates :date, :time, presence: true
  validate :time, uniqueness: {scope: :date}
end
