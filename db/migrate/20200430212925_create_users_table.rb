class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #encrypts the users password
      
      t.timestamps null: false
    end
  end
end
