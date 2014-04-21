movieRepository = require './movie-repository'

class MovieService

  getMovies:          -> movieRepository.getMovies()
  getMovie: (movieId) -> movieRepository.getMovie movieId

module.exports = new MovieService()