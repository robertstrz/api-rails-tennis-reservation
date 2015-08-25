class ChangeReservationColumnTypes < ActiveRecord::Migration
  def change
  remove_column :reservations, :time_to
  add_column :reservations, :time_to, :timestamp
  remove_column :reservations, :time_from
  add_column :reservations, :time_from, :timestamp
  end
end
