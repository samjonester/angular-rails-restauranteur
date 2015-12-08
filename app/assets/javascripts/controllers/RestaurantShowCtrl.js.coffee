@restauranteur.controller 'RestaurantShowCtrl', ['$scope', '$http', '$stateParams', '$location', ($scope, $http, $stateParams, $location) ->
  restaurantId = $stateParams.id
  $http.get("/restaurants/#{restaurantId}.json").success((data) ->
    $scope.restaurant = data
  )
  $scope.deleteRestaurant = ->
    $http.delete("/restaurants/"+restaurantId+".json").then((response)->
      $location.path("/restaurants")
    )
]
