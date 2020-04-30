class CreateSkis < ActiveRecord::Migration
  def change
    create_table :skis do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
