class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :id
      t.integer :category_id
      t.string :category_image

      t.timestamps
    end
  end
end
