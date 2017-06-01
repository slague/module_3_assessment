
require 'rails_helper'

describe 'Items API' do
  context 'record end points' do

    before do
      @item = Item.create(name: "Item",
                        description: "stuff and things",
                        image_url: "https://fakeimageurl")

      @item2 = Item.create(name: "Another Item",
                        description: "more stuff and things",
                        image_url: "https://anotherfakeimageurl")

  end

    it 'returns all items' do
      get '/api/v1/items.json'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.first['id']).to eq(@item.id)
    expect(items.first['name']).to eq(@item.name)
    expect(items.first['description']).to eq(@item.description)
    expect(items.first['image_url']).to eq(@item.image_url)
    # NEEDS TO REFACTOR -----------NOT the created_at or updated_at
  end

  it 'returns a single item' do
    get "/api/v1/items/#{@item.id}.json"
    expect(response).to be_success

    example_item = JSON.parse(response.body)

    expect(example_item['id']).to eq(@item.id)
    expect(example_item['name']).to eq(@item.name)
    expect(example_item['description']).to eq(@item.description)
    expect(example_item['image_url']).to eq(@item.image_url)

    expect(response.body).to_not include '@item2.id'
      # NEEDS TO REFACTOR -----------NOT the created_at or updated_at
  end

  it 'deletes an item' do

    expect{ delete "/api/v1/items/#{@item2.id}"}.to change(Item, :count).by(-1)
    expect(response).to be_success
    expect{Item.find(@item2.id)}.to raise_error(ActiveRecord::RecordNotFound)

  end

  end
end


# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
