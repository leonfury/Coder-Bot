class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
        t.string :username
        t.string :first_name, null: false
        t.string :last_name, null: false
        t.string :email, null: false
        t.string :address
        t.float :longtitude
        t.float :latitude
        t.string :poi
        t.string :encrypted_password, limit: 128, null: false
        t.string :confirmation_token, limit: 128
        t.string :remember_token, limit: 128, null: false
        t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
    end
  end

