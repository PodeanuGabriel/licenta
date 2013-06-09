class Category < ActiveRecord::Base
  attr_accessible :category_id, :category_image, :category_name, :id

  has_many :coupons
end
