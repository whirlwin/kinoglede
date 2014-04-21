q     = require 'q'
Movie = require './movie'

class MovieRepository

  getMovies: ->
    deferred = q.defer()
    Movie.find (err, movies) ->
      if err
        logger.error err
        deferred.reject err
      else
        deferred.resolve movies
    deferred.promise

  getMovie: (movieId) ->
    deferred = q.defer()
    Movie.findOne _id: movieId, (err, movie) ->
      if err
        logger.error err
        deferred.reject err
      else
        deferred.resolve movie
    deferred.promise

module.exports = new MovieRepository()