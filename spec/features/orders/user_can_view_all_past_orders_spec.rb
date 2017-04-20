require 'rails_helper'

RSpec.feature 'User can have multiple orders' do
  scenario 'they can can see all of their orders when logged in' do
    user = create(:experiences_order).order.user
    login(user)
    visit '/orders'
    expect(page).to have_content(user.orders.first.created_at)
    expect(page).to have_content(user.orders.last.created_at)
  end

  scenario 'they cannot see any orders when logged out' do
    user = create(:experiences_order).order.user
    experience = create(:experience)
    login(user)
    logout
    visit '/orders'
    expect(page).to_not have_content(user.orders.first.created_at)
  end

  scenario "they can't see any other users' orders" do
    user_1 = create(:experiences_order).order.user
    login(user_1)
    order1 = user_1.orders.first
    order2 = user_1.orders.last

    user_2 = create(:experiences_order).order.user
    order3 = user_2.orders.first
    order4 = user_2.orders.last

    visit '/orders'
    expect(page).to have_content(order1.status)
    expect(page).to have_content(order2.status)
    expect(page).to_not have_content(order3.status)
    expect(page).to_not have_content(order4.status)
  end
end
