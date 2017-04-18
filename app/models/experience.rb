class Experience < ActiveRecord::Base
  attr_accessor :image_path_file_name

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cost, presence: true
  # validates :category, presence: true
  
  has_many :experience_categories, dependent: :destroy
  has_many :categories, through: :experience_categories

  has_many :experiences_orders
  has_many :orders, through: :experiences_orders

  has_attached_file :photo, styles: { medium: "560x315>", thumb: "304x171>" }, default_url: "/images/backpacker.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

end
