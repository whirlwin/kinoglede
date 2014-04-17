mongoose = require 'mongoose'

userSchema = null
ObjectId = mongoose.Schema.Types.ObjectId

class User
  userSchema = new mongoose.Schema
    fbId:            type: String, required: true, unique: true
    name:            type: String, required: true
    gender:          type: String, required: true, enum: ['male', 'female']
    fbPictureUrl:    type: String, required: true, unique: true
    fbLocationId:    type: ObjectId, ref: 'Location'
    movies:          type: [ObjectId, ref: 'Movie']
    matchingUserIds: type: [ObjectId, ref: 'User']

module.exports = mongoose.model 'User', userSchema