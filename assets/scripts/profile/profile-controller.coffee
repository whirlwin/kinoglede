angular.module('kinoglede').controller 'ProfileController', ['$scope', 'Movies', 'MovieService', ($scope, Movies, MovieService) ->

  if $scope.data.isLoggedIn()
    $scope.data.movies = Movies.query()

  $scope.addMovie = (movie) ->
    MovieService.addMovie($scope.data.user.movies, movie)
]