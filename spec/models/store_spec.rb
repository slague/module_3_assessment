require 'rails_helper'

describe Store do

  attr_reader :weather_key, :zip, :forecast

  before do
    @key = ENV['API_KEY']
    @zip = 80202
  end


  context '.build_array_of_nearby_stores(key, zip)'


end
