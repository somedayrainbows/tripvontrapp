require 'rails_helper'

describe "User sees all experiences" do
  scenario "when they visit the category show" do

    arts = create(:category)
    art_walk = create_list(:experience, 2)

    # visit "/categories/arts"
    visit "/arts"

    expect(page).to have_content(arts.name)
save_and_open_page
    expect(page).to have_content(art_walk.first.title)
    expect(page).to have_content(art_walk.last.title)
    expect(page).to have_button("Add to cart")

  end
end
