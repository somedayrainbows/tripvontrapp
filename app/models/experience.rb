class Experience < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cost, presence: true
  # validates :category, presence: true

  has_many :experience_categories
  has_many :categories, through: :experience_categories

  has_many :experiences_orders
  has_many :orders, through: :experiences_orders

end
