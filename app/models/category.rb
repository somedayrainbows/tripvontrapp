class Category < ActiveRecord::Base
has_many :experiences

  def to_param
    name
  end
end
