movieService = require './movie-service'

class MovieController

  getMovies: (req, res) ->
    movieService.getMovies().then (movies) ->
      res.send 200, movies
    .fail (err) ->
      res.send 500, err

module.exports = new MovieController()