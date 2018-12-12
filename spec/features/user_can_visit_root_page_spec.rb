require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  scenario 'and enters a zip code in the search box' do
    it 'displays 10 closest stations and each station\'s details' do
      
      visit '/'
      
      fill_in :q, with '80203'

      click_on 'Locate'

      expect(current_path).to eq('/search')

      expect(page).to have_content('Nearest Stations')
      expect(page).to have_content('Name: ')
      expect(page).to have_content('Address: ')
      expect(page).to have_content('Fuel Types: ')
      expect(page).to have_content('Distance: ')
      expect(page).to have_content('Access Times: ')
    end
  end
end
