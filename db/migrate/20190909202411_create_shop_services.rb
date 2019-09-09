class CreateShopServices < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_services do |t|
      t.integer :price
      t.belongs_to :barber_shop, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
