class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :id
      t.string :user_id
      t.string :filters

      t.timestamps
    end
  end
end
