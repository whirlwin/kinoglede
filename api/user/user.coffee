mongoose = require 'mongoose'

userSchema = null

class User

  userSchema = new mongoose.Schema
    name:     type: String
    gender:   type: String, enum: ['male', 'female']
    location: type: String


module.exports = mongoose.model 'User', userSchema