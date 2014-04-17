Movie = require '../../src/movie/movie'

class DummyMovieUtility

  DUMMY_MOVIES = [
    new Movie
      title:    'Divergent'
      imageUrl: 'http://ia.media-imdb.com/images/M/MV5BMjM3MDIxMzY1NV5BMl5BanBnXkFtZTgwMzk5NjEzMDE@._V1_SX214_AL_.jpg'
    new Movie
      title:    'Noah'
      imageUrl: 'http://ia.media-imdb.com/images/M/MV5BMjAzMzg0MDA3OF5BMl5BanBnXkFtZTgwNTMzOTYwMTE@._V1_SY317_CR0,0,214,317_AL_.jpg'
    new Movie
      title: 'Need For Speed'
      imageUrl: 'http://ia.media-imdb.com/images/M/MV5BMTQ3ODY4NzYzOF5BMl5BanBnXkFtZTgwNjI3OTE4MDE@._V1_SX214_AL_.jpg'
  ]

  insertDummyMovies: ->
    DUMMY_MOVIES.forEach (dummyMovie) ->
      Movie.findOne title: dummyMovie.title, (err, movie) ->
        if err
          console.error err
        else if !movie
          dummyMovie.save (err) ->
            console.error err if err

module.exports = new DummyMovieUtility()