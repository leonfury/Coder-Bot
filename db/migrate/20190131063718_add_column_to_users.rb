class AddColumnToUsers < ActiveRecord::Migration[5.2]
    def change
        add_column :users, :lang, :text
        add_column :users, :git_link, :text
        add_column :users, :description, :text
        add_column :users, :avatar, :text
    end
end
