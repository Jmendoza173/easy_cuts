class AddSpecialtyToBarbers < ActiveRecord::Migration[6.0]
  def change
    add_column :barbers, :specialty, :string
  end
end
