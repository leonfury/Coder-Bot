class AddRemoveColumnMidpoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :midpoints, :username, :name
    add_column :midpoints, :category, :text
  end
end
