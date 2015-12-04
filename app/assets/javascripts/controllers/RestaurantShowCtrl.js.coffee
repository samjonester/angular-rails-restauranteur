@restauranteur.controller 'RestaurantShowCtrl', ['$scope', '$http', '$stateParams', ($scope, $http, $stateParams) ->
  $http.get("/restaurants/#{$stateParams.id}.json").success((data) ->
    $scope.restaurant = data
  )
]
