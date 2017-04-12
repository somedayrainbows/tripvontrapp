class Category < ActiveRecord::Base
  has_many :experience_categories
  has_many :experiences, through: :experience_categories

  # validates_uniqueness_of :name

  # before_save :create_slug

 #  attr_accessor :title
 #

 # def create_slug
  #self.slug = selft.title.parameterize
 #end


  def slug
    name.downcase.gsub(" ", "-")
  end
 #
 def to_param
   slug
 end


 # def self.find(input)
 #   find_by_name(input)
 # end



end
