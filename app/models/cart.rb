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

  # cart experiences

  # def cart_experiences
  #   # map over keys of contents for each of them call new PORO cart experiences
  #   # delegators, simple delegators
  #   contents.map do |id, quantity|
  #     byebug
  #     CartExperiences.new(id, quantity)
  #   end
  #   experience_ids = contents.keys
  #   Experience.where(id: experience_ids)
  # end

  def remove_experience(experience_id)
    contents.delete(experience_id)
  end
end
