@restauranteur.controller "RestaurantEditCtrl", ["$scope", "$http", "$state", "$stateParams", ($scope, $http, $state, $stateParams) ->
  restaurantId = $stateParams.id
  $http.get("/restaurants/#{restaurantId}.json").success((data) ->
    $scope.restaurant = data
  )

  $scope.editRestaurant = ->
    $http.put("/restaurants/"+restaurantId+".json", $scope.restaurant).then((response)->
      $scope.restaurant = response.data
      $state.go("restaurantDetails",{id: $scope.restaurant.id})
    , (response)->
      $scope.errorMessages = response.data
    )
]
