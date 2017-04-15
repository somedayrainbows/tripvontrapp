class ExperiencesOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :experience
end
