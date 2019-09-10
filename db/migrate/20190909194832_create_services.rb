class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :hair
      t.string :shape_up
      t.string :facial
      t.string :facial_hair
      t.string :extra

      t.timestamps
    end
  end
end
