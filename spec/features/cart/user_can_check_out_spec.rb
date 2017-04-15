require 'rails_helper'

RSpec.feature "User can check out" do
  before do
    @user = create(:user)
    login(@user)
    @experience1 = create(:experience)
    @experience2 = create(:experience)
    add_experience_to_cart(@experience1)
    add_experience_to_cart(@experience2)
  end

  scenario "user can click checkout button and place an order" do
    visit "/cart"

    click_on "Checkout"

    expect(current_path).to eq(orders_path)
    expect(@user.orders.count).to eq(1)
    expect(page).to have_content(@user.orders.first.experiences_orders.first.title)
    expect(page).to have_content(@user.orders.last.experiences_orders.last.title)

  end

end
# Background: An existing user and a cart with experiences
#
# As a visitor
# When I add experiences to my cart
# And I visit "/cart"
# And I click "Login or Register to Checkout"
# Then I should be required to login
#
# When I am logged in
# And I visit my cart
# And when I click "Checkout"
# Then the order should be placed
#
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table
