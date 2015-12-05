require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe "GET /restaurants" do
    let!(:restaurants) {
      [
        Restaurant.create(name: "Arby's"),
        Restaurant.create(name: "Wendy's")
      ]
    }

    it "Gets all restaurants" do
      get restaurants_path, format: :json
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json[0]['name']).to eq(restaurants[0].name)
      expect(json[0]['id']).to eq(restaurants[0].id)
      expect(json[1]['name']).to eq(restaurants[1].name)
      expect(json[1]['id']).to eq(restaurants[1].id)
    end

    it "Gets the count of restaurants" do
      get "#{restaurants_path}?count", format: :json
      expect(response).to have_http_status(200)
      expect(response.body).to eq('2')
    end
  end

  describe "GET /restaurant/:id" do
    let(:restaurant) { Restaurant.create(name: "Arby's", id: 0) }

    it "Gets the restaurant" do
      get restaurant_path(restaurant.id), format: :json
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['name']).to eq(restaurant.name)
      expect(json['id']).to eq(restaurant.id)
    end

    it "Fails to get an invalid restaurant" do
      bad_id = 15

      get (restaurant_path(bad_id)), format: :json
      expect(response).to have_http_status(404)
      json = JSON.parse(response.body)
      expect(json['error']).to eq("Restaurant not found")
    end
  end

  describe "POST /restaurants" do
    it "Creates /restaurants" do
      post restaurants_path, format: :json, restaurant: {name: "Arby's"}
      expect(Restaurant.find_by(name: "Arby's")).to_not be_nil
    end
    it "Fails to create an invalid restaurant" do
      post restaurants_path, format: :json, restaurant: {name: ''}
      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['name']).to include("can't be blank")
    end
    it "Fails to create a duplicate restaurant" do
      Restaurant.create(name: "Arby's")
      post restaurants_path, format: :json, restaurant: {name: "Arby's"}
      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['name']).to include("has already been taken")
    end
  end

  describe "PUT /restaurants/:id" do
    let(:restaurant) {Restaurant.create(name: "Arby's")}

    it "Updates a restaurant" do
      restaurant = Restaurant.create(name: "Arby's")
      put restaurant_path(restaurant), format: :json, restaurant: {name: "Wendy's"}
      expect(response).to have_http_status(200)
    end
    it "Fails to update an invalid restaurant" do
      restaurant = Restaurant.create(name: "Arby's")
      put restaurant_path(restaurant), format: :json, restaurant: {name: ""}
      restaurant.reload
      json = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['name']).to include("can't be blank")
    end
    it "Fails to update a restaurant that doesn't exist" do
      bad_id = 15

      put restaurant_path(bad_id), format: :json, restaurant: {name: "Wendy's"}
      expect(response.status).to eq(404)
      json = JSON.parse(response.body)
      expect(json['error']).to include("Restaurant not found")
    end
  end

  describe "DELETE /restaurants/:id" do
    let(:restaurant) {Restaurant.create(name: "Arby's")}

    it "Deletes a restaurant" do
      id = restaurant.id
      delete restaurant_path(id), format: :json
      expect(response).to have_http_status(204)
      expect(Restaurant.find_by(id: id)).to be_nil
    end
    it "Fails to delete a restaurant that doesn't exist" do
      bad_id = 15
      delete restaurant_path(bad_id), format: :json
      expect(response).to have_http_status(404)
      json = JSON.parse(response.body)
      expect(json['error']).to include("Restaurant not found")
    end
  end
end
