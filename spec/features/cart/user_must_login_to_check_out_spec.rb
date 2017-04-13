require 'rails_helper'

describe "User with items in their cart wants to checkout" do
  before do
    experience = create(:experience)

    visit experiences_path

    click_on "Add to cart"
    click_on "Cart"
  end

  context "when the user is logged out" do
    it "does not allow the user to checkout" do
      expect(page).to_not have_link("Checkout")
    end

    it "allows the user to Login" do
      expect(page).to have_link("Login")
    end

    it "allows the user to create an account" do
      expect(page).to have_link("Create Account")
    end
  end

  context "when the user is logged in" do
    it "allows the user to checkout" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)

      visit '/cart'

      expect(page).to have_link("checkout")

# save_and_open_page
        expect(page).to have_link("Logout")
    end

    it "allows the user to logout from the cart page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)

      visit '/cart'
      click_on "Logout"
      save_and_open_page


      visit '/cart'
      expect(page).to have_link("Create Account")
      expect(page).to_not have_link("checkout")

      #within navbar
      # expect(page).to have_link("Login")
    end
  end



end


# As a visitor when I have items in my cart
# And when I visit "/cart"
# I should not see an option to "Checkout"
# I should see an option to "Login or Create Account to Checkout"

# After I create an account
# And I visit "/cart
# Then I should see all of the data that was there when I was not logged in
#
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"
