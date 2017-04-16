require 'rails_helper'

RSpec.feature "A logged in admin" do
  before do
    @user = create(:user)
    @user.update(role: 1)
    login(@user)
    @user2 = create(:user)
    @user2.update(name: "User2")
  end

  scenario "sees an edit profile link on her profile page" do
    visit dashboard_path

    expect(page).to have_link("Edit profile")
  end

  scenario "clicks on edit profile, is redirected" do
    visit dashboard_path
    click_on "Edit profile"

    expect(current_path).to eq(edit_user_path(@user))
    expect(page).to have_content("Edit your profile")
  end

  scenario "clicks on edit profile, can update profile data" do
    visit edit_user_path(@user)

    fill_in "user[name]", with: "something new"
    click_on "Update"

    expect(page).to have_content("something new, you have updated your account.")
  end

  scenario "is not able to modify another user's account" do
    visit edit_user_path(@user2)
    expect(page).to_not have_content(@user2.name)
  end
end
