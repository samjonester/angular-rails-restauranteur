describe "Restaurant Create Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantCreateCtrl",  ->
    it "should create a restaurant", inject(($controller, $httpBackend) ->
      restaurantIn = {
        name: "Arby's"
      }
      restaurantOut = {
        name: restaurantIn.name
        id: 1
      }

      $httpBackend.whenPOST("/restaurants.json", restaurantIn).respond(201, restaurantOut)
      scope = {
        restaurant: restaurantIn
      }
      state = {
        go: (url, params) ->
      }

      $controller('RestaurantCreateCtrl', {
        $scope: scope
        $state: state
      })
      scope.createRestaurant(restaurantIn)
      spyOn(state, 'go')

      $httpBackend.flush()
      $httpBackend.expectPOST("/restaurants.json", restaurantIn)
      expect(state.go).toHaveBeenCalledWith('restaurantDetails', {id: restaurantOut.id})
      expect(scope.restaurant.name).toBe restaurantOut.name
      expect(scope.restaurant.id).toBe restaurantOut.id
    )

    it "should respond with errors when creation fails", inject(($controller, $httpBackend) ->
      restaurantIn = {
        name: ''
      }
      errorsOut = {
        name: ['cannot be blank']
      }

      $httpBackend.whenPOST("/restaurants.json", restaurantIn).respond(422, errorsOut)
      scope = {
       restaurant: restaurantIn
      }
      state = {
        go: (url, params) ->
      }

      $controller('RestaurantCreateCtrl', {
        $scope: scope
        $state: state
      })
      scope.createRestaurant(restaurantIn)
      spyOn(state, 'go')

      $httpBackend.flush()
      $httpBackend.expectPOST("/restaurants.json", restaurantIn)
      expect(JSON.stringify(scope.errorMessages)).toBe JSON.stringify(errorsOut)
    )
