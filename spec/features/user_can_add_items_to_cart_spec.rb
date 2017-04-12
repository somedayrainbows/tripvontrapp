require 'rails_helper'

RSpec.feature "When user adds experiences to cart", type: :feature do
  scenario "a message is displayed" do
    exp = create(:experience)

    visit experiences_path
    expect(page).to have_button("Add to cart")

    click_button "Add to cart"
    expect(page).to have_content("1 #{exp.title} added to your cart.")
  end

  scenario "message correctly increments for multiple items" do
    exp = create(:experience)

    visit experiences_path
    click_button "Add to cart"
    expect(page).to have_content("1 #{exp.title} added to your cart.")
    click_button "Add to cart"

    expect(page).to have_content("2 #{exp.title}s added to your cart.")

  end

  scenario "the total number of items in the cart increments" do
    create(:experience)

    visit experiences_path
    expect(page).to have_content("Cart (0)")

    click_button "Add to cart"
    expect(page).to have_content("Cart (1)")

    click_button "Add to cart"
    expect(page).to have_content("Cart (2)")


  end
  scenario "the cart shows all the experieces that have been added" do
    exp = create(:experience)
    visit experiences_path
    click_button "Add to cart"

    click_on "Cart"

    # And my current path should be "/cart"
    expect(current_path).to eq "/cart"

# page.should have_css('img', text: "image1.jpg")
# need to add image column to database
      # And I should see a small image, title, description and price for the item I just added
      expect(page).to have_content(exp.title)
      expect(page).to have_content(exp.description)
      expect(page).to have_content(exp.cost)

      within first('.adjust-cart') do
        expect(page).to have_button("+")
        expect(page).to have_button("-")
      end

      # And there should be a "total" price for the cart that should be the sum of all items in the cart
      expect(page).to have_content("Total:")
      expect(page).to have_content("25")

  end
end
