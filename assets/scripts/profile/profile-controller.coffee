angular.module('kinoglede').controller 'ProfileController', ['$scope', 'Movies', 'MovieService', ($scope, Movies, MovieService) ->

  if $scope.data.isLoggedIn()
    $scope.data.movies = Movies.query()

  $scope.addMovie = (movie) ->
    $scope.data.user.movies.push movie
    MovieService.addMovie($scope.data.user.movies, movie)
]