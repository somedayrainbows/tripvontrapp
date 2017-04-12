require 'rails_helper'


describe "visitor views all experiences" do
  xscenario "when they visit the experience index" do

      experience = build(:experience)
      visit categories_path

      expect(page).to have_content(experience.title)
      expect(page).to have_content(25)
      expect(page).to have_button("Add to cart")

  end
end
