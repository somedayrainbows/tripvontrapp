require 'rails_helper'

RSpec.feature "When user adds experiences to cart", type: :feature do
  scenario "a message is displayed" do
    exp = create(:experience)

    visit experiences_path
    within("#view_cart") do
      expect(page).to have_link("Cart")
    end

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

    expect(current_path).to eq "/cart"

    within("tbody tr:nth-child(1) div.col-sm-10") do
      expect(page).to have_content(exp.title)
      expect(page).to have_content(exp.description)
    end
    # xwithin()
    #   expect(page).to have_content(exp.cost)
    # end


    within ("tbody tr:nth-child(1) td.quantity") do
      expect(page).to have_link("+")
      expect(page).to have_link("-")
    end

    within("tfoot") do
      expect(page).to have_content("Total:")
      expect(page).to have_content("25")
    end
  end
end
