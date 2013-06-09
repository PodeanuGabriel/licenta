class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :id
      t.string :user_id
      t.integer :coupon_id

      t.timestamps
    end
  end
end
