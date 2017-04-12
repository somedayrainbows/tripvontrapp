class CartExperience < SimpleDelgator
  # extend Forwardable
  #
  # def_delegators :@experience, :title, :description, :cost, :city, :image_path

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super Experience.find_by(@id)
  end
end
