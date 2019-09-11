class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.belongs_to :service, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :barber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
