require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  context 'and enters a zip code in the search box' do
    it 'displays 10 closest stations and each station\'s details' do
      
      visit '/'
      
      fill_in :q, with: '80203'

      click_on 'Locate'

      expect(current_path).to eq('/search')
      expect(page).to have_content('10 Nearest Stations')
      expect(page).to have_css(".station", count:10)
      within(first(".station")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel-type")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access-time")
      end
    end
  end
end
