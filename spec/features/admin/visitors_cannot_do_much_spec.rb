require 'rails_helper'


RSpec.feature "visitor cannot do much" do
  scenario "a logged out user cannot view other users' private data" do
      user = create(:user)
      user2 = create(:experiences_order).order.user

      visit orders_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Email")
      expect(page).to_not have_content(user2.orders.last.status)
  end

  scenario "a logged out user cannot view any admin stuff" do
      user = create(:user)

      visit admin_dashboard_index_path

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
      expect(page).to_not have_content("Admin Dashboard")
  end

end
