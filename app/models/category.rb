class Category < ActiveRecord::Base
  attr_accessible
  has_many :experience_categories
  has_many :experiences, through: :experience_categories

end
