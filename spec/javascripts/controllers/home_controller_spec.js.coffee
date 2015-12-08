describe "Home Controller", ->

  beforeEach module("restauranteur")

  describe "HomeCtrl", ->
    it "gets the restaurant count", inject(($controller, $httpBackend) ->
      $httpBackend.whenGET('/restaurants.json?count').respond('20')
      scope = {}

      $controller("HomeCtrl",
        $scope: scope
      )

      $httpBackend.flush()
      $httpBackend.expectGET('/restaurants.json?count')
      expect(scope.restaurant_count).toBe '20'
    )
