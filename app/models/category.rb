class Category < ActiveRecord::Base
  has_many :experience_categories
  has_many :experiences, through: :experience_categories

  validates_uniqueness_of :title

 #  attr_accessor :title
 #
 #  def slug
 #    name.downcase.gsub(" ", "-")
 #  end
 # #
 # def to_param
 #   [id, title.parameterize].join("-")
 # end



end
