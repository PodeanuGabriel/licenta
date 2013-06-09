class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
  end
end
