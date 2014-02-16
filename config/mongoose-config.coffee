mongoose = require 'mongoose'

class MongooseConfig
  configure: ->
    mongoose.connect 'mongodb://localhost/kinoglede'

module.exports = MongooseConfig