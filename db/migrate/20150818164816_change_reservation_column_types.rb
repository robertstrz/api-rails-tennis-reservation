class ChangeReservationColumnTypes < ActiveRecord::Migration
  def change
	change_column :reservations, :time_to, :datetime
	change_column :reservations, :time_from, :datetime
  end
end
