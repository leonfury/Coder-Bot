class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
    	t.string :fname
    	t.string :lname
    	t.string :email
    	t.string :address
    	t.integer :longtitude
      t.integer :latitude
      t.string :poi

      t.timestamps
    end
  end
end
