describe "Restaurant Show Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantShowCtrl",  ->
    it "should return a restaurant", inject(($controller, $httpBackend) ->
      restaurantId = 0
      restaurant = {
        name: "Arby's",
        id: restaurantId
      }

      $httpBackend.whenGET("/restaurants/"+restaurantId+".json").respond(restaurant)
      scope = {}

      $controller('RestaurantShowCtrl', {
        $scope: scope,
        $stateParams: {id: restaurantId}
      })

      $httpBackend.flush()
      $httpBackend.expectGET("/restaurants/"+restaurantId+".json")
      expect(scope.restaurant.name).toBe restaurant.name
      expect(scope.restaurant.id).toBe restaurant.id
    )
