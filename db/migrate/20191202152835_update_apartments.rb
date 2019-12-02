class UpdateApartments < ActiveRecord::Migration[5.2]
  def change
    rename_column :apartments, :users_id, :user_id
  end
end
