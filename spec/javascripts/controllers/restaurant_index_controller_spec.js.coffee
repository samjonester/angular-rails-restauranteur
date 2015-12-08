describe "Restaurant Index Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantIndexCtrl",  ->
    it "should return a list of restaurants", inject(($controller, $httpBackend) ->
      restaurants = [
        {
          name: "Arby's",
          id: "0"
        },
        {
          name: "Wendy's",
          id: "1"
        }
      ]

      $httpBackend.whenGET("/restaurants.json").respond(restaurants)
      scope = {}

      $controller('RestaurantIndexCtrl', {
        $scope: scope
      })

      $httpBackend.flush()
      $httpBackend.expectGET("/restaurants.json")
      expect(scope.restaurants[0].name).toBe restaurants[0].name
      expect(scope.restaurants[0].id).toBe restaurants[0].id
      expect(scope.restaurants[1].name).toBe restaurants[1].name
      expect(scope.restaurants[1].id).toBe restaurants[1].id
    )
