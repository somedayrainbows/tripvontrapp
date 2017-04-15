require  'rails_helper'


RSpec.feature "User logs in as admin " do
  scenario "Admin is redirected to admin dashboard" do
    user = create(:user)
    user.update(role: 1)
    login(user)

    expect(current_path).to eq(admin_dashboard_index_path)
  end
end
