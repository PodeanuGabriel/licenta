class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :id
      t.string :preview_image
      t.string :showcase_image
      t.string :title
      t.string :description
      t.real :latitude
      t.real :longitude
      t.string :phone
      t.integer :company_id
      t.string :website
      t.string :redeem_schedule
      t.date :begin_date
      t.date :end_date
      t.string :redeem_code
      t.integer :number_of_coupons
      t.integer :category_id
      t.integer :price_without_coupon
      t.integer :price_with_coupon

      t.timestamps
    end
  end
end
