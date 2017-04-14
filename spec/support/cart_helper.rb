module CartHelper


def add_experience_to_cart(experience)
  visit experience_path(experience)
  click_on "Add to cart"
end

end
