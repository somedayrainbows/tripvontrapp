class CartExperience < SimpleDelegator

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super Experience.find(@id)
  end
end












# extend Forwardable
#
# def_delegators :@experience, :title, :description, :cost, :city, :image_path
# delegate :Experience, :title
