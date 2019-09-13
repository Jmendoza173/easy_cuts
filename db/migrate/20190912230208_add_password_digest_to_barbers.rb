class AddPasswordDigestToBarbers < ActiveRecord::Migration[6.0]
  def change
    add_column :barbers, :password_digest, :string
  end
end
