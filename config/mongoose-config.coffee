mongoose = require 'mongoose'

class MongooseConfig
  configure: ->
    mongoose.connect 'mongodb://localhost/kinoglede', (err) ->
      if err
        console.error 'Failed to connect to MongoDB: ' + err
      else
        console.log 'Connected to MongoDB'

module.exports = new MongooseConfig()