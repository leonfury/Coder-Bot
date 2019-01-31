class CreateCodelangs < ActiveRecord::Migration[5.2]
    def change
        create_table :codelangs do |t|
            t.string :lang
            t.belongs_to :user
            t.timestamps
        end
    end
end
