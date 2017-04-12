require 'rails_helper'

describe "User sees all experiences assigned to a single category" do
  scenario "when they visit that category's show page" do

    art_walk = create(:experience)
    category = art_walk.categories.first
    brewery_tour = create(:experience)
    brewery_tour.categories << category

    visit category_path(category)

    expect(category.experiences.count).to eq(2)
    expect(page).to have_content(art_walk.title)
    expect(page).to have_content(brewery_tour.title)

    expect(page).to have_button("Add to cart")

  end
end
