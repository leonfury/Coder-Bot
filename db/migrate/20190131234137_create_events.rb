class CreateEvents < ActiveRecord::Migration[5.2]
    def change
        create_table :events do |t|
            t.belongs_to :user
            t.belongs_to :midpoint
            t.text :remark
            t.date :event_date
            t.time :event_time
            t.timestamps
        end
    end
end
