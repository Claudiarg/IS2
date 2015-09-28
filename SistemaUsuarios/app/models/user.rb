class User < ActiveRecord::Base
  validates :name, :address, :email, :phone, :age, presence: true  
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
