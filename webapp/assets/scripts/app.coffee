App = angular.module 'kinoglede', ['ngRoute']

App.config ['$locationProvider', '$routeProvider', ($locationProvider, $routeProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
    .when('/', templateUrl: 'partials/index')
    .when('/matching', templateUrl: 'partials/matching')
    .otherwise(templateUrl: 'partials/404')
]