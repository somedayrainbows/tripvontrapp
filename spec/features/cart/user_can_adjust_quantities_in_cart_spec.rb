require 'rails_helper'

RSpec.feature 'User can adjust experience quantities in cart' do
  scenario 'user can increase quantities'do
    create(:experience)
    CartExperience.new("1", 1)

    visit cart_path

    within("quantity") do
      expect(page).to have_content(1)
    end

    within("subtotal") do
      expect(page).to have_content(25)
    end
    expect(page).to have_content('Total: $25')
    click_button '+'
    expect(current_path).to eq cart_path

    within("quantity") do
      expect(page).to have_content(50)
    end

    within("subtotal") do
      expect(page).to have_content(50)
    end
    expect(page).to have_content('Total: $50')
  end

  scenario 'user can decrease quantities' do
    create(:experience)
    create(:experience)
    CartExperience.new("1", 2)

    visit cart_path

    within("subtotal") do
      expect(page).to have_content(50)
    end
    expect(page).to have_content('Total: $50')
    click_button '-'
    expect(current_path).to eq cart_path

    within("quantity") do
      expect(page).to have_content(25)
    end

    within("subtotal") do
      expect(page).to have_content(25)
    end
    expect(page).to have_content('Total: $25')
  end
end
