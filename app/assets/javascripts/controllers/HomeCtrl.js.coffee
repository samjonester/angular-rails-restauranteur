@restauranteur.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->
  $http.get('/restaurants.json?count').success((data) ->
    $scope.restaurant_count = data
  )
]
