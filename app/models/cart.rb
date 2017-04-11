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

  def count_of(experience_id)
    contents[experience_id.to_s]
  end

end
