class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.integer :court_number
      t.string :court_surface

      t.timestamps null: false
    end
  end
end
