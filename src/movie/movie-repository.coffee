q     = require 'q'
Movie = require './movie'

class MovieRepository

  getMovies: ->
    deferred = q.defer()
    Movie.find (err, movies) ->
      if err
        console.error err
        deferred.reject err
      else
        deferred.resolve movies
    deferred.promise

module.exports = new MovieRepository()