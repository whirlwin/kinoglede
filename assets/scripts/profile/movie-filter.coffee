angular.module('kinoglede').filter 'movieFilter', ->
  (userMovies, movies) ->
    (movie for movie in movies when userMovies.indexOf(movie._id) != -1)
