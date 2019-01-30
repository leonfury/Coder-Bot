class CreateMidpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :midpoints do |t|
      t.string :username
      t.string :address
    	t.float :longtitude
      t.float :latitude
      t.string :poi

      t.timestamps
    end
  end
end
