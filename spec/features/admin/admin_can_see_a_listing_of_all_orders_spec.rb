require 'rails_helper'

RSpec.feature "As a logged in admin" do

  before do
    @admin = create(:user)
    @admin.update(role: 1)
    login(@admin)

    @user1 = create(:user_with_orders)
    @order1a = @user1.orders.first
    @order1a.update(status: "Ordered")
    @order1b = @user1.orders.last
    @order1b.update(status: "Paid")

    @user2 = create(:user_with_orders)
    @order2a = @user2.orders.first
    @order2a.update(status: "Cancelled")
    @order2b = @user2.orders.last
    @order2b.update(status: "Completed")

    @user3 = create(:user_with_orders)
    @order3a = @user3.orders.first
    @order3a.update(status: "Paid")
    @order3b = @user3.orders.last
    @order3b.update(status: "Completed")

    visit admin_dashboard_index_path
  end

  scenario "when admin vists dashboard, sees a listing of all orders with a link to each" do

    expect(page).to have_content(@order1a.id)
    expect(page).to have_content(@order1a.status)
    expect(page).to have_link('1')

    expect(page).to have_content(@order1b.id)
    expect(page).to have_content(@order1b.status)
    expect(page).to have_link('2')

    expect(page).to have_content(@order2a.id)
    expect(page).to have_content(@order2a.status)
    expect(page).to have_link('3')

    expect(page).to have_content(@order2b.id)
    expect(page).to have_content(@order2b.status)
    expect(page).to have_link('4')

    expect(page).to have_content(@order3a.id)
    expect(page).to have_content(@order3a.status)
    expect(page).to have_link('5')

    expect(page).to have_content(@order3b.id)
    expect(page).to have_content(@order3b.status)
    expect(page).to have_link('6')
  end

  scenario "Admin can click through order number to order show page" do
    click_on '1'

    expect(current_path).to eq(order_path(@order1a))
  end

  scenario "when admin vists dashboard, sees total number of orders for each status" do
    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Paid: 2")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Completed: 2")
  end

  scenario "when admin vists dashboard, can filter orders by status type" do

    click_on "ORDERED"

    expect(page).to have_content(@order1a.status)
    within(".order-table") do
      expect(page).to_not have_content(@order1b.status)
    end
    # expect(page).to have_link("PAID")
    # expect(page).to have_link("CANCELLED")
    # expect(page).to have_link("COMPLETED")
  end
  # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")


  xscenario "when admin vists dashboard, can view links to update status of each order" do

    visit dashboard_path

    expect(page).to have_link("Cancel #{@order1a.id}")
    expect(page).to have_link("Mark #{@order1a} Paid")
    expect(page).to have_link("Cancel #{@order1b}")
    expect(page).to have_link("Mark #{@order1b} as Completed")
    expect(page).to have_link("Cancel #{@order2a}")
    expect(page).to have_link("Mark #{@order2a} as Completed")
  end

  xscenario "when admin visits dashboard, can change status of incomplete orders" do
    visit dashboard_path
    click_on "Mark #{@order1a} Paid"

    expect(@order1a.status).to eq("paid")
    expect(page).to have_content("Paid, 3")
  end
end
# And I have links to transition between statuses
# - I can click on "cancel" on individual orders which are "paid" or "ordered"
# - I can click on "mark as paid" on orders that are "ordered"
# - I can click on "mark as completed" on orders that are "paid"
