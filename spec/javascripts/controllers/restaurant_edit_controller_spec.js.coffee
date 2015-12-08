
describe "Restaurant Edit Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantEditCtrl",  ->
    it "should edit a restaurant", inject(($controller, $httpBackend, $location) ->
      restaurantId = 1
      restaurantIn = {
        name: "Wendy's"
        id: restaurantId
      }
      restaurantOut = {
        name: restaurantIn.name
        id: restaurantId
      }

      $httpBackend.whenGET("/restaurants/"+restaurantId+".json").respond(restaurantIn)
      $httpBackend.whenPUT("/restaurants/"+restaurantId+".json", restaurantIn).respond(200, restaurantOut)
      spyOn($location, 'path')
      scope = {}

      $controller('RestaurantEditCtrl', {
        $scope: scope
        $stateParams: {id: restaurantId}
      })
      scope.editRestaurant(restaurantIn)

      $httpBackend.flush()
      $httpBackend.expectGET("/restaurants/"+restaurantId+".json")
      $httpBackend.expectPUT("/restaurants/"+restaurantId+".json", restaurantIn)
      expect($location.path).toHaveBeenCalledWith("/restaurants/"+restaurantOut.id)
      expect(scope.restaurant.name).toBe restaurantOut.name
      expect(scope.restaurant.id).toBe restaurantOut.id
    )
