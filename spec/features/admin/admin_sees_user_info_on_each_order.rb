require 'rails_helper'

RSpec.feature "When a logged in admin visits dashboard" do

  before do
    @admin = create(:user)
    @admin.update(role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    @user1 = create(:experiences_order).order.user
    @order1a = @user1.orders.first
    @order1a.update(status: "Ordered")
    @order1b = @user1.orders.last
    @order1b.update(status: "Paid")

    create(:experience)
    @order1a.experiences_orders.create(quantity: 2, subtotal: 50, experience_id: 1)

    visit admin_dashboard_index_path
  end

  scenario "can click on an individual order and sees order data and user data" do

    click_on "1"

    expect(current_path).to eq(order_path(@order1a))
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@order1a.experiences_orders.first.quantity)
    expect(page).to have_content(@order1a.experiences_orders.first.subtotal)
    expect(page).to have_content(@order1a.total_price)

  end
end
