class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :skis, :type, :category
  end
end
