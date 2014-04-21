angular.module('kinoglede').service 'ProfileService', ['$http', ($http) ->

  getMovies: -> $http.get('/movies')

  transformUserMovies: (userMovies, movies) ->
    userMovies = (movie for movie in movies when userMovies.indexOf(movie._id) != -1)

  addMovie: (userMovies, movie) ->
    hasMovie = !!(userMovie for userMovie in userMovies when userMovie._id == movie._id).length
    unless hasMovie
      userMovies.push movie
      $http.put '/users/me/movies/' + movie._id


  handleMoveMovieUp: (userMovieIds, $index) ->
    if $index != 0
      userMovieIds.splice $index - 1, 0, userMovieIds.splice($index, 1)[0]

  handleMoveMovieDown: (userMovieIds, $index) ->
    if $index != userMovieIds.length - 1
      userMovieIds.splice $index + 1, 0, userMovieIds.splice($index, 1)[0]
]