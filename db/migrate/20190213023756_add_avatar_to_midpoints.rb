class AddAvatarToMidpoints < ActiveRecord::Migration[5.2]
  def change
    add_column :midpoints, :photo, :text
  end
end
