class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.integer :owner_id
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
