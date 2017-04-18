require 'rails_helper'

RSpec.feature 'User can submit new experience' do
  before do
    @user = create(:user)
    category = Category.create(name: "Family Friendly")
    category2 = Category.create(name: "City Life")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit root_path
  end
  scenario 'logged in user can click on create new experience' do
    click_on 'Become a guide'

    expect(current_path).to eq(new_experience_path)
    expect(page).to have_content('Submit this form')
  end

  scenario 'logged in user can fill in form to create new experience' do
    click_on 'Become a guide'

    fill_in 'experience[title]', with: 'Fun Trip'
    fill_in 'experience[description]', with: 'The most fun you will have, this year. Guaranteed. Maybe.'
    fill_in 'experience[cost]', with: 10000
    fill_in 'experience[city]', with: 'Denver'

    check('category-1')
    check('category-2')

    click_on 'Create'

    expect(page).to have_content('Fun Trip')
    expect(page).to have_content('The most fun you will have, this year. Guaranteed. Maybe.')
    expect(page).to have_content(10000)
    expect(page).to have_content('Denver')
    expect(page).to have_content('Family Friendly')
    expect(page).to have_content('City Life')
    expect(page).to have_content('Your experience has been submitted for approval')
    expect(Experience.last.status).to eq('pending')
  end

  scenario 'pending experiences do not show on experience index' do
    exp = create(:experience)
    exp.update(status: 'pending')
    visit experiences_path

    expect(page).to_not have_content(exp.title)
  end

  scenario 'Admin user can see all pending trips on admin dashboard' do
    @user.update(role: 1)
    exp = create(:experience)
    exp.update(status: 'pending')
    exp1 = create(:experience)
    exp1.update(status: 'pending')

    visit admin_dashboard_index_path

    expect(page).to have_content(exp.title)
    expect(page).to have_content(exp1.title)
  end

  scenario 'Admin can delete experiences' do
    @user.update(role: 1)
    exp = create(:experience)
    exp.update(status: 'pending')
    exp1 = create(:experience)
    exp1.update(status: 'pending')

    visit experience_path(exp)

    click_on 'Delete'
    

    expect(page).to_not have_content(exp.title)
  end

end
