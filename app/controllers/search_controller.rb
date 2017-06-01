class SearchController < ApplicationController


  def index
    @stores = Store.build_array_of_nearby_stores(key, zip)
  end

end
