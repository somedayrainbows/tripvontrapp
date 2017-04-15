class Order < ActiveRecord::Base
  belongs_to :user

  has_many :experiences_orders
  has_many :experiences, through: :experiences_orders
end
