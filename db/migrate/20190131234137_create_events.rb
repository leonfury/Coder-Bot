class CreateEvents < ActiveRecord::Migration[5.2]
    def change
        create_table :events do |t|
            t.belongs_to :user
            t.belongs_to :midpoint
            t.text :remark
            t.datetime :event_time
            t.timestamps
        end
    end
end
