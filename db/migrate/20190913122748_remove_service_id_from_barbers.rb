class RemoveServiceIdFromBarbers < ActiveRecord::Migration[6.0]
  def change

    remove_column :barbers, :service_id, :bigint
  end
end
