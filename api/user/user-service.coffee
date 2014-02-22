async              = require 'async'
mongoose           = require 'mongoose'
q                  = require 'q'
User               = require './user'
UserRepository     = require './user-repository'
Location           = require './location/location'
LocationRepository = require './location/location-repository'

class UserService

  userRepository     = new UserRepository()
  locationRepository = new LocationRepository()

  findOrSaveUser: (profile) ->
    rawLocation = JSON.parse(profile._raw).location
    newLocation = new Location
      fbLocationId: rawLocation.id
      name:         rawLocation.name
    userRepository.findUser(fbId: profile.id).then (user) ->
      unless user
        locationRepository.findLocation(fbLocationId: newLocation.fbLocationId).then (location) ->
          unless location
            locationRepository.saveLocation(newLocation).then (location) ->
              saveUser profile, newLocation.id
          else
            saveUser profile, newLocation.id
      else
        user

  saveUser = (profile, fbLocationId) ->
    user = new User
      fbId:         profile.id
      name:         profile.displayName
      gender:       profile.gender
      fbLocationId: fbLocationId
    userRepository.saveUser(user).then (user) ->

module.exports = UserService