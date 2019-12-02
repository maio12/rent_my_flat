class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :title
      t.string :address
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
