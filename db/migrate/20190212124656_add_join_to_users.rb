class AddJoinToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :joined, :date
  end
end
