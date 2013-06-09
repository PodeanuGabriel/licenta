class Coupon < ActiveRecord::Base
  attr_accessible :begin_date, :category_id, :company_id, :description, :end_date, :id, :latitude, :longitude, :number_of_coupons, :phone, :preview_image, :price_with_coupon, :price_without_coupon, :redeem_code, :redeem_schedule, :showcase_image, :title, :website

  belongs_to :company, :foreign_key => "company_id"
  belongs_to :category, :foreign_key => "category_id"

  has_many :transactions
end
