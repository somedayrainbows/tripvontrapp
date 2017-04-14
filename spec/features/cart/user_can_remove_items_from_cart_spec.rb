require 'rails_helper'

RSpec.feature "User can remove item from cart" do
  scenario "Item is removed from cart when remove is clicked" do
    exp = create(:experience)
    visit experiences_path
    click_on "Add to cart"
    click_on "Cart"

    click_on "remove"
    expect(current_path).to eq(cart_path)
    # And I should see a message styled in green
    expect(page).to have_content("Successfully removed")

    within("tbody") do
      expect(page).to_not have_content(exp.title)
      expect(page).to_not have_content(exp.description)
      expect(page).to_not have_content(exp.cost)
      expect(page).to_not have_css("img[src*='#{exp.image_path}']")
    end

  # As a visitor
  # When I visit "/cart"
  # And I click link "Remove"
  # Then my current page should be "/cart"
  # And the message should say "Successfully removed SOME_ITEM from your cart."
  # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
  # And I should not see the item listed in cart
  end
  scenario 'flash message has link to removed experience show page' do
    exp = create(:experience)
    visit experiences_path
    click_on "Add to cart"
    click_on "Cart"

    click_on "remove"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed")
    expect(page).to have_content(exp.title)

    click_on exp.title

    expect(current_path).to eq experience_path(exp)
  end
end
