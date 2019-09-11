class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :age
      t.string :favorite_barber
      t.string :location
      t.string :email
      t.string :password
      t.integer :cell

      t.timestamps
    end
  end
end
