class AddCityRefToCourts < ActiveRecord::Migration
  def change
    add_reference :courts, :city, index: true
    add_foreign_key :courts, :cities
  end
end
