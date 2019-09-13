class RemovePasswordFromBarbers < ActiveRecord::Migration[6.0]
  def change

    remove_column :barbers, :password, :string
  end
end
