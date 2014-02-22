Location = require './location/location'
mongoose = require 'mongoose'

userSchema     = null

class User
  userSchema = new mongoose.Schema
    fbId:       type: String, required: true, unique: true
    name:       type: String, required: true
    gender:     type: String, required: true, enum: ['male', 'female']
    locationId: type: mongoose.Schema.Types.ObjectId, ref: 'Location'

module.exports = mongoose.model 'User', userSchema