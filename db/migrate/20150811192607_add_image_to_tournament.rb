class AddImageToTournament < ActiveRecord::Migration
  def change
	add_column :tournaments, :image_uid,  :string
  end
end
