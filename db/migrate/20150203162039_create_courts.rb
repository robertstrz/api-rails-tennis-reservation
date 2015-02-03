class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.integer :court_number
      t.references :user, index: true
      t.string :time_from
      t.string :time_to

      t.timestamps null: false
    end
    add_foreign_key :courts, :users
  end
end
