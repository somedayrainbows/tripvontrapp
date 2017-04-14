require 'rails_helper'

describe "User with items in their cart wants to checkout" do
  before do
    experience = create(:experience)
    add_experience_to_cart(experience)
    visit '/cart'
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
    before do
      user = create(:user)
      login(user)
    end

    it "allows the user to checkout" do
      visit '/cart'

      expect(page).to have_link("Checkout")
      expect(page).to have_link("Logout")
    end
  end
end
