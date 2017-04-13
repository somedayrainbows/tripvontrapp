class CartExperience < SimpleDelegator

  attr_reader :id, :quantity

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super Experience.find(id)
  end

  def subtotal
    self.cost * quantity
  end

end
