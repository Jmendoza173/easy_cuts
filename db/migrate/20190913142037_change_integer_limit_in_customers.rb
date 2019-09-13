class ChangeIntegerLimitInCustomers < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :cell, :integer, limit: 8
  end
end
