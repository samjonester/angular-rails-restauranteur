@restauranteur.controller 'RestaurantIndexCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.restaurants = []
  $http.get('/restaurants.json').success((data) ->
    $scope.restaurants = data
  )
]
