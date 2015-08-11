class DropCityTable < ActiveRecord::Migration
  def change
def up
    drop_table :cities
  end
  end
end
