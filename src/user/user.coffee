mongoose = require 'mongoose'

userSchema = null

class User
  userSchema = new mongoose.Schema
    fbId:            type: String, required: true, unique: true
    name:            type: String, required: true
    gender:          type: String, required: true, enum: ['male', 'female']
    fbPictureUrl:    type: String, required: true, unique: true
    fbLocationId:    type: mongoose.Schema.Types.ObjectId, ref: 'Location'
    matchingUserIds: type: [mongoose.Schema.Types.ObjectId, ref: 'User']

module.exports = mongoose.model 'User', userSchema