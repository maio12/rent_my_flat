class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date_in
      t.date :date_out
      t.references :user
      t.references :apartment

      t.timestamps
    end
  end
end
