angular.module('kinoglede').service 'MovieService', ['$http', ($http) ->

  getMovies: -> $http.get('/movies')

  addMovie: (userMovieIds, movie) ->
    hasMovie = userMovieIds.indexOf(movie._id) != -1
    unless hasMovie
      userMovieIds.push movie._id
      $http.put('/users/me/movies/' + movie._id)

  handleMoveMovieUp: (userMovieIds, $index) ->
    if $index != 0
      userMovieIds.splice $index - 1, 0, userMovieIds.splice($index, 1)[0]

  handleMoveMovieDown: (userMovieIds, $index) ->
    if $index != userMovieIds.length - 1
      userMovieIds.splice $index + 1, 0, userMovieIds.splice($index, 1)[0]
]