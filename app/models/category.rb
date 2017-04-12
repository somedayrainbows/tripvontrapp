class Category < ActiveRecord::Base
  has_many :experience_categories
  has_many :experiences, through: :experience_categories

  validates_uniqueness_of :name

 #  attr_accessor :title
 #
 #  def slug
 #    name.downcase.gsub(" ", "-")
 #  end
 #
 def to_param
   name
 end


 # def self.find(input)
 #   find_by_name(input)
 # end



end
