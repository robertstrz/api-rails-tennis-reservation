class RemoveTimeFromAndTimeToFromCourt < ActiveRecord::Migration
  def change
    remove_column :courts, :time_from, :string
    remove_column :courts, :time_to, :string
  end
end
