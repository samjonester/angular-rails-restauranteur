@restauranteur = angular.module("restauranteur", ["ui.router"])

@restauranteur.config(["$stateProvider", "$urlRouterProvider", "$locationProvider", ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider.otherwise("/")
  $stateProvider.
    state("home", {
      url: "/",
      controller: "HomeCtrl",
      templateUrl: "templates/home.html"
    }).
    state("restaurants", {
      url: "/restaurants",
      controller: "RestaurantIndexCtrl",
      templateUrl: "templates/restaurants/index.html"
    }).
    state("restaurant", {
      url: "/restaurants/:id",
      controller: "RestaurantShowCtrl",
      templateUrl: "templates/restaurants/show.html"
    })
])
