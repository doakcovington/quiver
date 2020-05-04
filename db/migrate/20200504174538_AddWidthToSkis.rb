class AddWidthToSkis < ActiveRecord::Migration
  def change
    add_column :skis, :width, :integer
  end
end
