require 'rails_helper'

RSpec.feature 'User can adjust experience quantities in cart' do
  scenario 'user can increase quantities'do
    create(:experience)
    visit experiences_path
    click_button "Add to cart"

    visit cart_path

    # within("tbody tr:nth-child(1)") do
    #   expect(page).to have_content(1)
    # end

    within("tbody tr:nth-child(1) td.subtotal") do
      expect(page).to have_content(25)
    end

    expect(page).to have_content('Total: $25')

    click_button '+'
    expect(current_path).to eq cart_path

    # within("tbody tr:nth-child(1) ") do
    #   expect(page).to have_content(50)
    # end

    within("tbody tr:nth-child(1) td.subtotal") do
      expect(page).to have_content(50)
    end

    expect(page).to have_content('Total: $50')
  end

  scenario 'user can decrease quantities' do
    create(:experience)
    visit experiences_path
    click_button "Add to cart"

    visit cart_path

    within("tbody tr:nth-child(1) td.subtotal") do
      expect(page).to have_content(25)
    end

    expect(page).to have_content('Total: $25')

    click_button '+'
    expect(current_path).to eq cart_path

    # within("tbody tr:nth-child(1) ") do
    #   expect(page).to have_content(50)
    # end

    within("tbody tr:nth-child(1) td.subtotal") do
      expect(page).to have_content(50)
    end

    expect(page).to have_content('Total: $50')

    click_button '-'
    expect(current_path).to eq cart_path

    # within("quantity") do
    #   expect(page).to have_content(25)
    # end

    within("tbody tr:nth-child(1) td.subtotal") do
      expect(page).to have_content(25)
    end

    expect(page).to have_content('Total: $25')
  end
end
