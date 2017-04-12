class Category < ActiveRecord::Base
  has_many :experience_categories
  has_many :experiences, through: :experience_categories

  validates_uniqueness_of :name

  before_save :create_slug



  def create_slug
    self.slug = name.parameterize
  end

 def to_param
   self.slug
 end

end
