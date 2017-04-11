class Experience < ActiveRecord::Base
  has_many :experience_categories
  has_many :categories, through: :experience_categories



end
