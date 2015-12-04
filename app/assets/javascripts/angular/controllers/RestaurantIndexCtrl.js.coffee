@restauranteur.controller 'RestaurantIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.restaurants = []
  $http.get('/restaurants.json').success((data) ->
    $scope.restaurants = data
    $scope.viewRestaurant = (id) ->
      $location.url "/restaurants/#{id}"
  )
]
