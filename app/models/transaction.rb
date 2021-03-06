class Transaction < ActiveRecord::Base
  attr_accessible :buy_date, :coupon_id, :id, :quantity, :user_id, :savings

  belongs_to :coupon, :foreign_key => "coupon_id"
end
