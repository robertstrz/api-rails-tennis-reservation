class RemoveUserIdFromCourt < ActiveRecord::Migration
  def change
	remove_column :courts, :user_id
  end
end
