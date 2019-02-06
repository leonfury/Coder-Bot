class ChangeDataTypeUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :longtitude, :string
    change_column :users, :latitude, :string
  end
end
