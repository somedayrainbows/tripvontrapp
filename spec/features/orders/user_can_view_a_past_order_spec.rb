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
    # experience1 = create(:experience)
    # experience2 = create(:experience)
    # @order_1.experiences << [experience1, experience2]

    click_on @order_1.status
    expect(current_path).to eq(order_path(@order_1))
    # expect(page).to have_content(@order_1.experiences.first.title)
    # expect(page).to have_content(@order_1.experiences.last.title)
    expect(page).to have_content(@order_1.experiences_orders.first.quantity)
    expect(page).to have_content(@order_1.experiences_orders.last.quantity)
    expect(page).to have_content(@order_1.experiences_orders.first.subtotal)
    expect(page).to have_content(@order_1.experiences_orders.last.subtotal)
  end
    # # And I should see links to each experience's show page
    # expect(page).to have_link("Experience")
    # # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    # expect(page).to have_content("Order Status")
    # expect(page).to have_content("completed")
    # # And I should see the total price for the order
    # expect(page).to have_content("Total Price")
    # expect(page).to have_content("$100")
    # # And I should see the date/time that the order was submitted
    # expect(page).to have_content("Date")
    # expect(page).to have_content("01-30-17")
    # #
    # # If the order was completed or cancelled
    # # Then I should see a timestamp when the action took place
    # expect(page).to have_content("Timestamp: 01-30-17")

end
