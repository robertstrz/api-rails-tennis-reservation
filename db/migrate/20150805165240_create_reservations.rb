class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :court, index: true
      t.time :from
      t.time :to
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :reservations, :courts
  end
end
