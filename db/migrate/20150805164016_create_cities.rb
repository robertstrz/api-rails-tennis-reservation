class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :court_ammount
      t.string :phone_number
      t.string :address

      t.timestamps null: false
    end
  end
end
