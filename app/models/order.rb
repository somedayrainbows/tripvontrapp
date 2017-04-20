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

  def self.ordered_status_count
    where(status: "Ordered").count
  end

  def self.paid_status_count
    where(status: "Paid").count
  end

  def self.cancelled_status_count
    where(status: "Cancelled").count
  end

  def self.completed_status_count
    where(status: "Completed").count
  end

end
