class AddImageUidToArticle < ActiveRecord::Migration
  def change
	add_column :articles, :image_uid,  :string
  end
end
