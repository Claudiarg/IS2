class User < ActiveRecord::Base
  validates :name, :address, :email, :phone, :age, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
