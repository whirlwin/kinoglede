movieRepository = require './movie-repository'

class MovieService

  getMovies: -> movieRepository.getMovies()

module.exports = new MovieService()