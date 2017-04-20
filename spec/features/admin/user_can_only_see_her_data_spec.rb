require 'rails_helper'


RSpec.feature "user can only see her data" do
  scenario "when a logged in user views orders, she only sees her orders" do
      user = create(:experiences_order).order.user
      user2 = create(:experiences_order).order.user
      login(user)

      visit orders_path

      expect(page).to have_content(user.orders.last.status)
      expect(page).to_not have_content(user2.orders.last.status)
  end

  scenario "when a logged in user views orders, cannot see any admin data" do
      user = create(:experiences_order).order.user
      login(user)

      visit admin_dashboard_index_path

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
      expect(page).to_not have_content("Admin Dashboard")
  end

end
