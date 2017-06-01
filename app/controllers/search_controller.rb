class SearchController < ApplicationController


  def index
    location = Location.find(params[:id])
    @stores = Location.build_array_of_nearby_stores(key, location.zip)
  end

end
