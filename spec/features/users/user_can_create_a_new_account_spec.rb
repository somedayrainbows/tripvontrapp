require 'rails_helper'

describe 'User visits root' do
  scenario 'they click a link to login and are redirected to a login page where they see the form to create a new account' do
    # As a visitor
    # When I visit "/"
# visit "/"
    # Then I should see a link for "Login"
    # And when I click "Login"
# click_link "Login"
    # And I should be on the "/login" page
    visit "/login"

    expect(current_path).to eq(login_path)

    # I should see a place to insert my credentials to login
    # And I should see a link to "Create Account"
    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Login")
    expect(page).to have_content("Create New Account")
  end
end

describe "user visits login page" do
  scenario "they can create a new account and login" do
    # As a visitor
    # When I visit "/login
    visit "/login"
    # And when I click link "Create Account"
    click_on "Create New Account"

    expect(current_path).to eq(new_user_path)
    # And I fill in my desired credentials
    fill_in "Name", with: "Natbot"
    fill_in "Email", with: "nat@nat.com"
    fill_in "Password", with: "password"
    click_on "Create Account"


    # And I submit my information
    # Then my current page should be "/dashboard"
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Logged in as Natbot. Welcome!")
    # And I should see my profile information
    expect(page).to have_content("Profile Information")
    expect(page).to have_content("User: Natbot")
    expect(page).to have_content("Email: nat@nat.com")
    # And I should not see a link for "Login"
    expect(page).to_not have_content("Login")
    # And I should see a link for "Logout"
    expect(page).to have_button("Logout")

    click_on "Logout"

    expect(current_path).to eq(login_path)
  end
end
