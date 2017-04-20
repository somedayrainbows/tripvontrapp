require 'rails_helper'

RSpec.feature "User visits orders page" do
  before do
    @user = create(:experiences_order).order.user
    login(@user)
    @order_1 = @user.orders.first
    @order_2 = @user.orders.last
    visit "/orders"
  end

  scenario "user can click on a past order" do
    within("div.orders div:nth-child(1)") do
      expect(page).to have_link(@order_1.status)
    end
  end

  scenario "user can see order detail on an order's page" do

    click_on @order_1.status
    expect(current_path).to eq(order_path(@order_1))

    expect(page).to have_content(@order_1.experiences_orders.first.quantity)
    expect(page).to have_content(@order_1.experiences_orders.last.quantity)
    expect(page).to have_content(@order_1.experiences_orders.first.subtotal)
    expect(page).to have_content(@order_1.experiences_orders.last.subtotal)
  end
end
