require 'rails_helper'

describe Store do

  before do
    @key = ENV['API_KEY']
    @zip = 80202
    @stores = [
       { longName: "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
         city: "DENVER",
         distance: 3.45,
         phone: "303-270-9189",
         storeType: "Mobile SAS"
       },
       { longName: "BEST BUY - BELMAR",
         city: "LAKEWOOD",
         distance: 5.31,
         phone: "303-742-8039",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - COLORADO BLVD",
         city: "DENVER",
         distance: 5.59,
         phone: "303-758-5805",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - DENVER WEST",
         city: "LAKEWOOD",
         distance: 8.39,
         phone: "303-273-5617",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - WESTMINSTER",
         city: "WESTMINSTER",
         distance: 8.52,
         phone: "303-426-4434",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - NORTHGLENN",
         city: "DENVER",
         distance: 9.14,
         phone: "303-252-8677",
         storeType: "Big Box"
       },
       { longName: "BEST BUY MOBILE - TOWN CENTER AT AURORA",
         city: "AURORA",
         distance: 9.73,
         phone: "303-326-0848",
         storeType: "Mobile SAS"
       },
       { longName: "BEST BUY - AURORA",
         city: "AURORA",
         distance: 9.79,
         phone: "303-338-5797",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - LITTLETON",
         city: "LAKEWOOD",
         distance: 10.44,
         phone: "303-932-7830",
         storeType: "Big Box"
       },
       { longName: "BEST BUY - SOUTHGLENN",
         city: "CENTENNIAL",
         distance: 11.02,
         phone: "303-797-3246",
         storeType: "Big Box" }
     ]

  end

  context '.build_array_of_nearby_stores(key, zip)' do
    it 'it builds an array of ten store objects', vcr: true do
      allow(StoreService).to receive(:get_stores).with(@key, @zip).and_return(@stores)
      location = Location.new(@zip)
      nearby_stores = location.build_array_of_nearby_stores(@key, @zip)

      first_store = nearby_stores[0]
      last_store = nearby_stores[9]

      expect(nearby_stores).to be_an(Array)
      expect(nearby_stores.count).to eq(10)

      expect(first_store.longName).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(first_store.city).to eq("DENVER")
      expect(first_store.distance).to eq(3.45)
      expect(first_store.phone).to eq("303-270-9189")
      expect(first_store.storeType).to eq("Mobile SAS")

      expect(last_store.longName).to eq("BEST BUY - SOUTHGLENN")
      expect(last_store.city).to eq("CENTENNIAL")
      expect(last_store.distance).to eq(11.02)
      expect(last_store.phone).to eq("303-797-3246")
      expect(last_store.storeType).to eq("Big Box")
    end
  end
end
