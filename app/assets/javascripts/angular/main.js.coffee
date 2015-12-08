@restauranteur = angular.module("restauranteur", ["ui.router"])

@restauranteur.config(["$stateProvider", "$urlRouterProvider", ($stateProvider, $urlRouterProvider) ->
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
    state("newRestaurant", {
      url: "/restaurants/new",
      controller: "RestaurantCreateCtrl",
      templateUrl: "templates/restaurants/new.html"
    }).
    state("restaurantDetails", {
      url: "/restaurants/:id",
      controller: "RestaurantShowCtrl",
      templateUrl: "templates/restaurants/show.html"
    }).
    state("editRestaurant", {
      url: "/restaurants/:id/edit",
      controller: "RestaurantEditCtrl",
      templateUrl: "templates/restaurants/edit.html"
    }).
    state("deleteRestaurant", {
      url: "/restaurants/:id/delete",
      controller: "RestaurantDeleteCtrl",
    })
])
