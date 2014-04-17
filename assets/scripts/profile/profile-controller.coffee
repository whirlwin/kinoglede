angular.module('kinoglede').controller 'ProfileController', ['$scope', 'Movies', ($scope, Movies) ->

  if $scope.data.isLoggedIn()
    $scope.data.movies = Movies.query()

  addMovie = (movieId) ->

]