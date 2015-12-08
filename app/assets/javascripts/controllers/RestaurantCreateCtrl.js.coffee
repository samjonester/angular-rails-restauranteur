@restauranteur.controller "RestaurantCreateCtrl", ["$scope", "$http", "$state", ($scope, $http, $state)->
  $scope.createRestaurant = ->
    $http.post("/restaurants.json", $scope.restaurant).then((response)->
        $scope.restaurant = response.data
        $state.go("restaurantDetails",{id: $scope.restaurant.id})
      , (response)->
        $scope.errorMessages = response.data
    )
]
