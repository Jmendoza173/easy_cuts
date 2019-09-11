class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :if_available
      t.boolean :accept_cash
      t.boolean :accept_card
      t.integer :cell
      t.belongs_to :barber_shop, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
