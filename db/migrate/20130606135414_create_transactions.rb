class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :id
      t.string :user_id
      t.integer :coupon_id
      t.date :buy_date
      t.integer :quantity

      t.timestamps
    end
  end
end
