class RemoveReferenceFieldFromCitiesTest < ActiveRecord::Migration
  def change
	remove_column :cities, :court_id
  end
end
