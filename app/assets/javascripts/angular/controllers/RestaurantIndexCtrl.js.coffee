@restauranteur.controller 'RestaurantIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.restaurants = []
  $http.get('./restaurants.json').success((data) ->
    $scope.restaurants = data
  )
]
