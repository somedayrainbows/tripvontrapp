class Order < ActiveRecord::Base
  belongs_to :user

  has_many :experiences_orders
  has_many :experiences, through: :experiences_orders

  def add_experience_to_order(cart)
    cart.cart_experiences.each do |cart_experience|
      self.experiences_orders.create(quantity:      cart_experience.quantity,
                                     subtotal:      cart_experience.subtotal,
                                     experience_id: cart_experience.id)
    end
  end

  def total_price
    self.experiences_orders.reduce(0) { |sum, exp| sum+= exp.subtotal }
  end
end
