class RemoveReferenceFieldFromCourt < ActiveRecord::Migration
  def change
	remove_reference(:cities, :court_id, index: true, foreign_key: true)
  end
end
