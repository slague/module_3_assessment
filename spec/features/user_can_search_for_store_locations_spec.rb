require 'rails_helper'
#
feature "User can search for store locations by zipcode" do
  context "when I enter a zipcode, I get a list stores within 25 miles" do
    scenario "I see the total number of locations and the first 10 results" do #, vcr: true do
#

#
      visit root_path
      fill_in 'Zipcode' with: 80202

      click_on "Search"
#
      expect(current_path).to eq("/search")
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_selector('.store', count: 10)

    within first('.store') do
      expect(page).to have_content("Name: ")
      expect(page).to have_content("City: ")
      expect(page).to have_content("Distance:")
      expect(page).to have_content("Phone: ")
      expect(page).to have_content("Store Type: ")
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


@stores = {stores: [
    {
      "longName": "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
      "city": "DENVER",
      "distance": 3.45,
      "phone": "303-270-9189",
      "storeType": "Mobile SAS"
    },
    {
      "longName": "BEST BUY - BELMAR",
      "city": "LAKEWOOD",
      "distance": 5.31,
      "phone": "303-742-8039",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - COLORADO BLVD",
      "city": "DENVER",
      "distance": 5.59,
      "phone": "303-758-5805",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - DENVER WEST",
      "city": "LAKEWOOD",
      "distance": 8.39,
      "phone": "303-273-5617",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - WESTMINSTER",
      "city": "WESTMINSTER",
      "distance": 8.52,
      "phone": "303-426-4434",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - NORTHGLENN",
      "city": "DENVER",
      "distance": 9.14,
      "phone": "303-252-8677",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY MOBILE - TOWN CENTER AT AURORA",
      "city": "AURORA",
      "distance": 9.73,
      "phone": "303-326-0848",
      "storeType": "Mobile SAS"
    },
    {
      "longName": "BEST BUY - AURORA",
      "city": "AURORA",
      "distance": 9.79,
      "phone": "303-338-5797",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - LITTLETON",
      "city": "LAKEWOOD",
      "distance": 10.44,
      "phone": "303-932-7830",
      "storeType": "Big Box"
    },
    {
      "longName": "BEST BUY - SOUTHGLENN",
      "city": "CENTENNIAL",
      "distance": 11.02,
      "phone": "303-797-3246",
      "storeType": "Big Box"
    }
  ]
