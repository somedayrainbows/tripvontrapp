class CartExperience < SimpleDelegator

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super Experience.find(@id)
  end
end
