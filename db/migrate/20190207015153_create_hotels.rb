class CreateHotels < ActiveRecord::Migration[5.2]
    def change
        create_table :hotels do |t|
            t.string :hotel_name
            t.string :star
            t.integer :price
            t.string :city
            t.text :address
            t.string :link
            t.string :longtitude
            t.string :latitude
            t.timestamps
        end
    end
end
