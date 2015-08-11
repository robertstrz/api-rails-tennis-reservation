class AddImageNameToArticle < ActiveRecord::Migration
  def change
	add_column :articles, :image_name, :string
  end
end
