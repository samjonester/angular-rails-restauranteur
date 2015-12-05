describe "Restaurant Show Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantShowCtrl",  ->
    it "should return a restaurant", inject(($controller, $httpBackend) ->
      restaurant = {
        name: "Arby's",
        id: "0"
      }

      $httpBackend.whenGET("/restaurants/0.json").respond(restaurant)
      $httpBackend.expectGET("/restaurants/0.json")
      scope = {}

      $controller('RestaurantShowCtrl', {
        $scope: scope,
        $stateParams: {id: '0'}
      })
      $httpBackend.flush()

      expect(scope.restaurant.name).toBe restaurant.name
      expect(scope.restaurant.id).toBe restaurant.id
    )
