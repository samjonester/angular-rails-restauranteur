@restauranteur.controller "RestaurantCreateCtrl", ["$scope", "$http", "$location", ($scope, $http, $location)->
  $scope.createRestaurant = ->
    $http.post("/restaurants.json", $scope.restaurant).then((response)->
        $scope.restaurant = response.data
        $location.path("/restaurants/"+$scope.restaurant.id)
      , (response)->
        $scope.errorMessages = response.data
    )
]
