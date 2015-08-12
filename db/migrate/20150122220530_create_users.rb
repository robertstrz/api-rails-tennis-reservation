class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :surname
      t.string :email
      t.string :password_digest
      t.string :access_token

      t.timestamps null: false
    end
  end
end
