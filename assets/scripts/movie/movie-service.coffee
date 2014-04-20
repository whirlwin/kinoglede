angular.module('kinoglede').service 'MovieService', ['$http', ($http) ->
  addMovie: (userMovieIds, movie) ->
    hasMovie = userMovieIds.indexOf(movie._id) != -1
    unless hasMovie
      userMovieIds.push movie._id
      $http.put('/users/me/movies/' + movie._id)
]