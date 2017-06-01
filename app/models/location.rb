class Location

  def initialize(zip)
    @zip = zip
  end


  def build_array_of_nearby_stores(key, zip)
    StoreService.get_stores(key, zip).map do |data|
      Store.new(data)
    end
  end

end
