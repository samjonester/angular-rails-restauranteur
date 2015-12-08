describe "Restaurant Delete Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantDeleteCtrl",  ->
    it "should delete a restaurant", inject(($controller, $httpBackend) ->
      restaurantId = 0
      restaurant = {
        name: "Arby's"
        id: restaurantId
      }

      scope = {
        restaurant: restaurant
      }
      state = {
        go: (url) ->
      }
      $httpBackend.whenDELETE("/restaurants/"+restaurantId+".json").respond(204)

      $controller('RestaurantDeleteCtrl', {
        $scope: scope
        $stateParams: {id: restaurantId}
        $state: state
      })
      spyOn(state, 'go')

      $httpBackend.flush()
      $httpBackend.expectDELETE("/restaurants/"+restaurantId+".json")
      expect(state.go).toHaveBeenCalledWith("restaurants")
    )
