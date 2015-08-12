class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.integer :court_number
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :courts, :users
  end
end
