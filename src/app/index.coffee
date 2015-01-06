main = require "./main"

angular.module "cannasos", [
  'ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap', 'infinite-scroll',
  main.name
]
.config ($stateProvider, $urlRouterProvider, RestangularProvider, $locationProvider) ->
  $urlRouterProvider.otherwise '/advices'
  RestangularProvider.setBaseUrl 'https://cannasos.com/api'
  $locationProvider.hashPrefix('!')
