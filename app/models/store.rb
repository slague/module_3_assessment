class Store

  attr_reader :longName, :city, :distance, :phone, :storeType

  def initialize(attrs = {})
    @longName =  attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @storeType = attrs[:storeType]
  end

  def build_array_of_nearby_stores(key, zip)
    StoreService.get_stores(key, zip)

  end

end
