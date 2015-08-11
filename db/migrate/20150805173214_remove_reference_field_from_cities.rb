class RemoveReferenceFieldFromCities < ActiveRecord::Migration
  def change
	remove_reference :cities, :court_id 
  end
end
