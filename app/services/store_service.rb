class StoreService

  def self.get_stores(key, zip)
    response = Faraday.get(
    "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{key}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:stores]
  end
end
