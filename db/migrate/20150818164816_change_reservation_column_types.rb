class ChangeReservationColumnTypes < ActiveRecord::Migration
  def change
	change_column :reservations, :time_to, :timestamp
	change_column :reservations, :time_from, :timestamp
  end
end
