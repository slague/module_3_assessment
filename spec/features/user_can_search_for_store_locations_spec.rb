require 'rails_helper'
#
feature "User can search for store locations by zipcode" do
  context "when I enter a zipcode, I get a list stores within 25 miles" do
    scenario "I see the total number of locations and the first 10 results" do #, vcr: true do



      visit root_path
      fill_in :zip, with: 80202
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("16 Total Stores")
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

# ```
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
# ```
