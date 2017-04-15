class Experience < ActiveRecord::Base
  has_many :experience_categories
  has_many :categories, through: :experience_categories

  has_many :experiences_orders
  has_many :orders, through: :experiences_orders
end
