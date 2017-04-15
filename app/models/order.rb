class Order < ActiveRecord::Base
  belongs_to :user

  has_many :experiences_orders
  has_many :experiences, through: :experiences_orders
  

  def add_experience_to_order(cart)
    cart.contents.each do |id, quantity|
      experience = Experience.find(id.to_i)
      self.experiences_orders.create(title:         experience.title,
                                     description:   experience.description,
                                     cost:          experience.cost,
                                     quantity:      quantity,
                                     subtotal:      (experience.cost * quantity),
                                     experience_id: experience.id)
    end
  end
end
