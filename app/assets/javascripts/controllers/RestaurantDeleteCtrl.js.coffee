@restauranteur.controller 'RestaurantDeleteCtrl', ['$http', '$stateParams', '$state', ($http, $stateParams, $state) ->
  $http.delete("/restaurants/#{$stateParams.id}.json").then((response)->
    $state.go("restaurants")
  )
]
