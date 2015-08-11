class RenameColumnInArticles < ActiveRecord::Migration
  def change
	rename_column :articles, :autho, :author
  end
end
