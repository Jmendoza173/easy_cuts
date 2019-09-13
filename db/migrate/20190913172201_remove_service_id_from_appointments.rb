class RemoveServiceIdFromAppointments < ActiveRecord::Migration[6.0]
  def change

    remove_column :appointments, :service_id, :bigint
  end
end
