angular.module('kinoglede').service 'ProfileService', ['$http', ($http) ->

  getMovies: -> $http.get('/movies')

  transformUserMovies: (userMovies, movies) ->
    newUserMovies = []
    userMovies.forEach (userMovie) ->
      movies.forEach (movie) ->
        newUserMovies.push movie if userMovie == movie._id
    newUserMovies

  addMovie: (userMovies, movie) ->
    hasMovie = (userMovie for userMovie in userMovies when userMovie._id == movie._id).length
    unless hasMovie
      userMovies.push movie
      $http.post '/users/me/movies/' + movie._id

  handleMoveMovieUp: (userMovies, $index) ->
    handleMoveMovie userMovies, $index, $index, 'up' if $index != 0

  handleMoveMovieDown: (userMovies, $index) ->
    handleMoveMovie userMovies, $index, $index + 1, 'down' if $index != userMovies.length - 1

  handleMoveMovie = (userMovies, $index, insertAt, direction) ->
    userMovieId = userMovies[$index]._id
    userMovies.splice insertAt, 0, userMovies.splice($index, 1)[0]
    $http.put "/users/me/movies/#{userMovieId}?direction=#{direction}}"
]