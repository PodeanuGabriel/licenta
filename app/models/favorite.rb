class Favorite < ActiveRecord::Base
  attr_accessible :coupon_id, :id, :user_id
end
