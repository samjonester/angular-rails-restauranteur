
describe "Restaurant Edit Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantEditCtrl",  ->
    it "should edit a restaurant", inject(($controller, $httpBackend) ->
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
      scope = {}
      state = {
        go: (url, params)->
      }

      $controller('RestaurantEditCtrl', {
        $scope: scope
        $stateParams: {id: restaurantId}
        $state: state
      })
      scope.editRestaurant(restaurantIn)
      spyOn(state, 'go')

      $httpBackend.flush()
      $httpBackend.expectGET("/restaurants/"+restaurantId+".json")
      $httpBackend.expectPUT("/restaurants/"+restaurantId+".json", restaurantIn)
      expect(state.go).toHaveBeenCalledWith("restaurantDetails",{id: restaurantOut.id})
      expect(scope.restaurant.name).toBe restaurantOut.name
      expect(scope.restaurant.id).toBe restaurantOut.id
    )
