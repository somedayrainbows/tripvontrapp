class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_experience(experience_id)
    contents[experience_id.to_s] ||= 0
    contents[experience_id.to_s] += 1
  end

  def subtract_experience(experience_id)
    contents[experience_id.to_s] ||= 0
    contents[experience_id.to_s] -= 1
  end


  def count_of(experience_id)
    contents[experience_id.to_s]
  end

  def cart_experiences
    contents.map do |id, quantity|
      CartExperience.new(id, quantity)
    end
  end

  def remove_experience(experience_id)
    contents.delete(experience_id)
  end

  def total
    cart_collection = cart_experiences
    cart_collection.reduce(0) { |sum, exp| sum + exp.subtotal }
  end

end
