require 'rails_helper'

describe "User sees all experiences" do
  scenario "when they visit the category show" do

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
