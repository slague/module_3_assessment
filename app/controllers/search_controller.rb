class SearchController < ApplicationController


  def index
    location = Location.new(:zip)
    @stores = location.build_array_of_nearby_stores(ENV['API_KEY'], params[:zip])
  end

end
