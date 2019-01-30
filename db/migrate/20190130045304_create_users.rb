class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
    	t.string :fname
    	t.string :lname
    	t.string :email
    	t.string :address
    	t.float :longtitude
      t.float :latitude
      t.string :poi

      t.timestamps
    end
  end
end
