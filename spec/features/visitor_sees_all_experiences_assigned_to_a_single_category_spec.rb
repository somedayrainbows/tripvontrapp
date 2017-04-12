require 'rails_helper'

describe "User sees all experiences assigned to a single category" do
  scenario "when they visit that category's show page" do
    category = build(:category)
    experience = build_list(:experience, 2)

    visit category_path(category)


    visit "/arts"


    expect(page).to have_content("arts")
    expect(page).to have_content(experience.first.title)
    expect(page).to have_content(experience.last.title)
    expect(page).to have_button("Add to cart")

  end
end
