User               = require './user'
UserRepository     = require './user-repository'
Location           = require './location/location'
LocationRepository = require './location/location-repository'

class UserService

  userRepository     = new UserRepository()
  locationRepository = new LocationRepository()

  findOrSaveUser: (profile) ->
    newLocation = extractLocation profile
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

  findMatchingUsers: (userId) ->
    # TODO: Implement matching algorithm
    userRepository.findUsers()

  extractLocation = (profile) ->
    rawLocation = JSON.parse(profile._raw).location
    new Location
      fbLocationId: rawLocation.id
      name:         rawLocation.name

  saveUser = (profile, fbLocationId) ->
    userRepository.save new User(
      fbId:         profile.id
      name:         profile.displayName
      gender:       profile.gender
      fbLocationId: fbLocationId
    )

module.exports = UserService