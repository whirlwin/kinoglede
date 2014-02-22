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
    location = new Location
      locationId: rawLocation.id
      name:       rawLocation.name

    locationRepository.saveLocation(location).then (location) ->
      user = new User
        name:       profile.displayName
        gender:     profile.gender
        locationId: location.id

      userRepository.findOrSaveUser(user).then (user) ->

module.exports = UserService