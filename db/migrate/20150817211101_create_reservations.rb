class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :court
      t.references :user
      t.time :time_from
      t.time :time_to
      t.date :day

      t.timestamps null: false
    end
  end
end
