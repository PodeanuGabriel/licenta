class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :email, :first_name, :id, :last_name, :password , :password_confirmation
  
  has_many :companies
end
