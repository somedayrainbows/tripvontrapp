require 'rails_helper'

describe "User sees all experiences in a category" do
  scenario "user sees all experiences" do

    arts = create(:category)
    art_walk = create_list(:experience, 2)

    visit category_path

    expect(page).to have_content(arts.name1)
    expect(page).to have_content(art_walk.title1)
    expect(page).to have_content(art_walk.title2)
    expect(page).to have_button("Add to cart")

  end
end
