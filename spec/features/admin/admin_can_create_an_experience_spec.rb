require 'rails_helper'

RSpec.feature 'Admin can create an experience' do
  before do
    @admin = create(:user)
    @admin.update(role: 1)
    category = Category.create(name: "Family Friendly")
    category2 = Category.create(name: "City Life")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_dashboard_index_path
  end
  scenario 'admin dashboard has link to add new experience' do
    expect(page).to have_link("Add Experience")
  end

  scenario 'admin is able to click on add experience' do
    click_on 'Add Experience'

    expect(current_path).to eq(new_experience_path)
    expect(page).to have_content("Add New Experience")
  end
  scenario 'admin is able to create an active experience' do
    click_on 'Add Experience'

    fill_in 'experience[title]', with: 'Fun Trip'
    fill_in 'experience[description]', with: 'The most fun you will have, this year. Guaranteed. Maybe.'
    fill_in 'experience[cost]', with: 10000
    fill_in 'experience[city]', with: 'Denver'
    fill_in 'experience[image_path]', with: "https://www.flairtradetravels.org/assets/city_life.jpg"

    check('category-1')
    check('category-2')


    click_on 'Create'

    expect(current_path).to eq("/experiences/#{Experience.last.id}")
    expect(page).to have_content('Fun Trip')
    expect(page).to have_content('The most fun you will have, this year. Guaranteed. Maybe.')
    expect(page).to have_content(10000)
    expect(page).to have_content('Denver')
    expect(page).to have_content('Family Friendly')
    expect(page).to have_content('City Life')
  end
end
