require 'rails_helper'

describe StoreService do

  before do
    @key = ENV['API_KEY']
    @zip = 80202
  end

  context '.get_stores', vcr: true do
    it 'returns an array of raw information' do
      stores = StoreService.get_stores(@key, @zip)
      first_store = stores[0]

      expect(stores).to be_an(Array)
      expect(stores.count).to eq(10)
      expect(first_store).to have_key(:longName)
      expect(first_store).to have_key(:city)
      expect(first_store).to have_key(:distance)
      expect(first_store).to have_key(:phone)
      expect(first_store).to have_key(:storeType)
    end
  end
end


# @stores = [
#     { longName: "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
#       city: "DENVER",
#       distance: 3.45,
#       phone: "303-270-9189",
#       storeType: "Mobile SAS"
#     },
#     { longName: "BEST BUY - BELMAR",
#       city: "LAKEWOOD",
#       distance: 5.31,
#       phone: "303-742-8039",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - COLORADO BLVD",
#       city: "DENVER",
#       distance: 5.59,
#       phone: "303-758-5805",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - DENVER WEST",
#       city: "LAKEWOOD",
#       distance: 8.39,
#       phone: "303-273-5617",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - WESTMINSTER",
#       city: "WESTMINSTER",
#       distance: 8.52,
#       phone: "303-426-4434",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - NORTHGLENN",
#       city: "DENVER",
#       distance: 9.14,
#       phone: "303-252-8677",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY MOBILE - TOWN CENTER AT AURORA",
#       city: "AURORA",
#       distance: 9.73,
#       phone: "303-326-0848",
#       storeType: "Mobile SAS"
#     },
#     { longName: "BEST BUY - AURORA",
#       city: "AURORA",
#       distance: 9.79,
#       phone: "303-338-5797",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - LITTLETON",
#       city: "LAKEWOOD",
#       distance: 10.44,
#       phone: "303-932-7830",
#       storeType: "Big Box"
#     },
#     { longName: "BEST BUY - SOUTHGLENN",
#       city: "CENTENNIAL",
#       distance: 11.02,
#       phone: "303-797-3246",
#       storeType: "Big Box" }
#   ]
