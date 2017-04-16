require 'rails_helper'

describe 'User visits login page' do
  let(:user) { build(:user) }
  scenario 'and sees a Create New Account link' do
    visit login_path

    expect(page).to have_link("Create New Account")
  end

  scenario 'and visits the new account page' do
    visit login_path
    click_link('Create New Account')

    expect(current_path).to eq(new_user_path)
  end

  scenario "and signs up for a new account" do
    visit login_path
    click_on "Create New Account"

    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Create"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.name}. Welcome!")
    expect(page).to have_content("Profile Information")
    expect(page).to have_content("User: #{user.name}")
    expect(page).to have_content("Email: #{user.email}")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end
end
