class Company < ActiveRecord::Base
  attr_accessible :address, :id, :logo, :name, :owner_id, :website

  belongs_to :user, :foreign_key => "owner_id"

  has_many :coupons
  
end
