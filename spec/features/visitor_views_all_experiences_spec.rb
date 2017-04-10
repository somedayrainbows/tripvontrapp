require 'rails_helper'


describe "visitor views all experiences" do
  scenario "when they visit the experience index" do

      art_walk = create(:experience)
      visit experiences_path

      expect(page).to have_content(art_walk.title)
      expect(page).to have_content(25)
      expect(page).to have_button("Add to cart")

  end
end
