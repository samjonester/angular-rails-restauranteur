describe "Restaurant Create Controller", ->
  beforeEach module("restauranteur")

  describe "RestaurantCreateCtrl",  ->
    it "should create a restaurant", inject(($controller, $httpBackend, $location) ->
      restaurantIn = {
        name: "Arby's"
      }
      restaurantOut = {
        name: restaurantIn.name
        id: 1
      }

      $httpBackend.whenPOST("/restaurants.json", restaurantIn).respond(201, restaurantOut)
      spyOn($location, 'path')
      scope = {
        restaurant: restaurantIn
      }

      $controller('RestaurantCreateCtrl', {
        $scope: scope
      })
      scope.createRestaurant(restaurantIn)

      $httpBackend.flush()
      $httpBackend.expectPOST("/restaurants.json", restaurantIn)
      expect($location.path).toHaveBeenCalledWith('/restaurants/'+restaurantOut.id)
      expect(scope.restaurant.name).toBe restaurantOut.name
      expect(scope.restaurant.id).toBe restaurantOut.id
    )

    it "should respond with errors when creation fails", inject(($controller, $httpBackend, $location) ->
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

      $controller('RestaurantCreateCtrl', {
        $scope: scope
      })
      scope.createRestaurant(restaurantIn)

      $httpBackend.flush()
      $httpBackend.expectPOST("/restaurants.json", restaurantIn)
      expect(JSON.stringify(scope.errorMessages)).toBe JSON.stringify(errorsOut)
    )
