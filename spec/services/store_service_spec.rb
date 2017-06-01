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


#
