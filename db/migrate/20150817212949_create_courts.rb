class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.references :city
      t.integer :court_number
      t.string :surface

      t.timestamps null: false
    end
  end
end
