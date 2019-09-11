class AddPasswordDigestToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :password_digest, :string
    remove_column :customers, :password 
  end
end
