App = angular.module 'kinoglede', ['ngRoute', 'ngResource']

App.config ['$locationProvider', '$routeProvider', ($locationProvider, $routeProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
    .when('/',           templateUrl: '/partials/index')
    .when('/_=_',        redirectTo:  '/') # On Facebook sign in
    .when('/innlogging', templateUrl: '/partials/login')
    .when('/min-profil', templateUrl: '/partials/profile')
    .when('/matching',   templateUrl: '/partials/match')
    .otherwise(          templateUrl: '/partials/404')
]