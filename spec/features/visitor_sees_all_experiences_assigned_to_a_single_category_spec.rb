require 'rails_helper'

describe "User sees all experiences assignd to a single category" do
  scenario "when they visit that category's show page" do
    category = build(:category)
    experience = build_list(:experience, 2)

    visit category_path(category)

    expect(page).to have_content(category.name)
    expect(page).to have_content(experience.title1)
    expect(page).to have_content(experience.title2)
    expect(page).to have_button("Add to cart")

  end
end
