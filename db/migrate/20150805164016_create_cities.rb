class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :court, index: true
      t.string :name
      t.integer :court_ammount
      t.string :phone_number

      t.timestamps null: false
    end
    add_foreign_key :cities, :courts
  end
end
