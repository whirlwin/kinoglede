angular.module('kinoglede').service 'ProfileService', ['$http', ($http) ->

  getMovies: -> $http.get('/movies')

  transformUserMovies: (userMovies, movies) ->
    newUserMovies = []
    userMovies.forEach (userMovie) ->
      movies.forEach (movie) ->
        if userMovie == movie._id
          newUserMovies.push movie
    newUserMovies

  addMovie: (userMovies, movie) ->
    hasMovie = (userMovie for userMovie in userMovies when userMovie._id == movie._id).length
    unless hasMovie
      userMovies.push movie
      $http.post '/users/me/movies/' + movie._id

  handleMoveMovieUp: (userMovies, $index) ->
    if $index != 0
      userMovieId = userMovies[$index]._id
      toIndex = $index - 1
      userMovies.splice toIndex, 0, userMovies.splice($index, 1)[0]
      $http.put "/users/me/movies/#{userMovieId}?direction=up"

  handleMoveMovieDown: (userMovies, $index) ->
    if $index != userMovies.length - 1
      userMovies.splice $index + 1, 0, userMovies.splice($index, 1)[0]
]