class CreateMidpoints < ActiveRecord::Migration[5.2]
    def change
        create_table :midpoints do |t|
        t.string :username
        t.text :address
        t.text :description
        t.float :longtitude
        t.float :latitude
        t.text :poi

        t.timestamps
        end
    end
end
