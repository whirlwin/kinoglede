angular.module('kinoglede').controller 'ProfileController', ['$scope', '$filter', 'Movies', 'MovieService', ($scope, $filter, Movies, MovieService) ->

  if $scope.data.isLoggedIn()
    MovieService.getMovies().success (movies) ->
      $scope.data.movies = movies
      $scope.data.user.movies = $filter('movieFilter')($scope.data.user.movies, movies)

  $scope.addMovie      = (movie)  -> MovieService.addMovie($scope.data.user.movies, movie)
  $scope.moveMovieUp   = ($index) -> MovieService.handleMoveMovieUp $scope.data.user.movies, $index
  $scope.moveMovieDown = ($index) -> MovieService.handleMoveMovieDown $scope.data.user.movies, $index
]