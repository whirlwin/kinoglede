angular.module('kinoglede').controller 'ProfileController', ['$scope', '$filter', 'ProfileService', ($scope, $filter, ProfileService) ->

  if $scope.data.isLoggedIn()
    ProfileService.getMovies().success (movies) ->
      $scope.data.movies = movies
      $scope.data.user.movies = ProfileService.transformUserMovies $scope.data.user.movies, movies

  $scope.addMovie = (movie)  ->
    ProfileService.addMovie $scope.data.user.movies, movie

  $scope.moveMovieUp   = ($index) -> ProfileService.handleMoveMovieUp $scope.data.user.movies, $index

  $scope.moveMovieDown = ($index) -> ProfileService.handleMoveMovieDown $scope.data.user.movies, $index
]