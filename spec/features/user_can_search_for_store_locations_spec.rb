require 'rails_helper'
#
feature "User can search for store locations by zipcode" do
  context "when I enter a zipcode, I get a list stores within 25 miles" do
    scenario "I see the total number of locations and the first 10 results" do #, vcr: true do



      visit root_path
      fill_in :zip, with: 80202
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Search Results")
      expect(page).to have_selector('.store', count: 10)

      within first('.store') do
        expect(page).to have_content("Name: BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(page).to have_content("City: DENVER")
        expect(page).to have_content("Distance: 3.45 miles")
        expect(page).to have_content("Phone: 303-270-9189")
        expect(page).to have_content("Store Type: Mobile SAS")
        end
      end
    end
end
