mongoose = require 'mongoose'

class MongooseConfig
  configure: ->
    mongoose.connect 'mongodb://localhost/kinoglede'
    console.log 'foobar...'

module.exports = MongooseConfig