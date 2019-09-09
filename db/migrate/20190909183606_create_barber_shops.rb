class CreateBarberShops < ActiveRecord::Migration[6.0]
  def change
    create_table :barber_shops do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
