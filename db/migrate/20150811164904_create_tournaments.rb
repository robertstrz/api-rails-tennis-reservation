class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :title
      t.text :content
      t.date :from
      t.date :to
      t.string :contact
      t.string :author
      t.string :surface
      t.string :city

      t.timestamps null: false
    end
  end
end
