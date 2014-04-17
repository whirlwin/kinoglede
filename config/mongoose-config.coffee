mongoose          = require 'mongoose'
dummyMovieUtility = require './utilities/dummy-movie-utility'

class MongooseConfig
  configure: ->
    mongoose.connect 'mongodb://localhost/kinoglede', (err) ->
      if err
        console.error 'Failed to connect to MongoDB: ' + err
      else
        console.log 'Connected to MongoDB'
        dummyMovieUtility.insertDummyMovies()

module.exports = new MongooseConfig()