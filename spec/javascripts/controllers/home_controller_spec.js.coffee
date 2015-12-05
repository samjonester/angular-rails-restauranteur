describe "Home Controller", ->

  beforeEach module("restauranteur")

  describe "HomeCtrl", ->

  it "Get the restaurant count", inject(($controller, $httpBackend) ->
    $httpBackend.whenGET('/restaurants.json?count').respond('20')
    $httpBackend.expectGET('/restaurants.json?count')
    scope = {}

    $controller("HomeCtrl",
      $scope: scope
    )
    $httpBackend.flush()

    expect(scope.restaurant_count).toBe '20'
  )
