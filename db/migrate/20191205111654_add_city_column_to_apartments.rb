class AddCityColumnToApartments < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :city, :string
  end
end
