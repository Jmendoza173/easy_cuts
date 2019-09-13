class ChangeIntegerLimitInBarbers < ActiveRecord::Migration[6.0]
  def change
    change_column :barbers, :cell, :integer, limit: 8
  end
end
