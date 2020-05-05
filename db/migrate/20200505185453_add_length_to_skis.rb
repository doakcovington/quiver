class AddLengthToSkis < ActiveRecord::Migration
  def change
    add_column :skis, :length, :integer
  end
end
