Location = require './location/location'
mongoose = require 'mongoose'

userSchema     = null

class User

  userSchema = new mongoose.Schema
    name:       type: String, required: true
    gender:     type: String, enum: ['male', 'female']
    locationId: type: mongoose.Schema.Types.ObjectId, ref: 'Location'

module.exports = mongoose.model 'User', userSchema