@restauranteur.controller "RestaurantEditCtrl", ["$scope", "$http", "$location", "$stateParams", ($scope, $http, $location, $stateParams) ->
  restaurantId = $stateParams.id
  $http.get("/restaurants/#{restaurantId}.json").success((data) ->
    $scope.restaurant = data
  )

  $scope.editRestaurant = ->
    $http.put("/restaurants/"+restaurantId+".json", $scope.restaurant).then((response)->
      $scope.restaurant = response.data
      $location.path("/restaurants/"+restaurantId)
    , (response)->
      $scope.errorMessages = response.data
    )
]
