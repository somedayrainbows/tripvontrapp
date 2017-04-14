require 'rails_helper'

RSpec.feature 'User can have multiple orders' do
  scenario 'they can can see all of their orders when logged in' do
    # As an Authenticated User
    user = create(:user_with_orders)
    login(user)
    # When I visit "/orders"
    visit '/orders'
    # Then I should see all orders belonging to me and no other orders
    expect(page).to have_content(user.orders.first.created_at)
    expect(page).to have_content(user.orders.last.created_at)
  end

  scenario 'they cannot see any orders when logged out' do
    user = create(:user_with_orders)
    login(user)
    logout
    visit '/orders' #build the auth/next & nest the order under users
    save_and_open_page

    expect(page).to_not have_content(user.orders.first.created_at)
  end

  xscenario "they can't see any other users orders" do
    user_1 = create(:user)
    login(user)
    order_1= user_1.order.create(:order)
    order_2= user_1.order.create(:order)

    user_2 = create(:user)
    login(user)
    order_3= user_2.order.create(:order)
    order_4= user_2.order.create(:order)

    expect(page).to have_content(order_3)
    expect(page).to have_content(order_4)
  end
end
