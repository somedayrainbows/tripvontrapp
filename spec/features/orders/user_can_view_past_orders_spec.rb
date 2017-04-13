require 'rails_helper'

RSpec.feature 'Existing user can have multiple orders' do
  scenario 'they can can see all orders belonging to them' do
    # As an Authenticated User
    # When I visit "/orders"
    # Then I should see all orders belonging to me and no other orders
    user = create(:user)
    order = user.order.create_list(:order, 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)

    visit '/orders'
    expect(page).to have_content(order.date)
  end

  scenario "they can't see any other users orders" do
    user_1 = create(:user)
    order_1= user_1.order.create(:order)
    order_2= user_1.order.create(:order)

    user_2 = create(:user)
    order_3= user_2.order.create(:order)
    order_4= user_2.order.create(:order)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)

    expect(page).to have_content(order_3)
    expect(page).to have_content(order_4)
  end
end
