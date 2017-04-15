require 'rails_helper'

RSpec.feature "User can only add an active experience to cart" do
  before do
    @experience1 = create(:experience)
    @experience2 = create(:experience)
    @experience2.update(status: "retired")
  end

  scenario "an active experience has an 'Add to Cart' button" do
    visit experience_path(@experience1)

    expect(page).to have_button("Add to cart")
  end

  scenario "a retired experience does not have an 'Add to Cart' button" do
    visit experience_path(@experience2)

    expect(page).to_not have_button("Add to cart")
  end
end
# As a user if I visit an experience page and that experience has been retired
# Then I should still be able to access the experience page
# And I should not be able to add the experience to their cart
# And I should see in place of the "Add to Cart" button or link - "Experience Retired"
