q                  = require 'q'
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

  findMatchingUsers: (currentUserId) ->
    matchingCriteria = if currentUserId then _id: ($ne: currentUserId) else null
    userRepository.findUsers matchingCriteria

  extractLocation = (profile) ->
    rawLocation = JSON.parse(profile._raw).location
    new Location
      fbLocationId: rawLocation.id
      name:         rawLocation.name

  saveUser = (profile, fbLocationId) ->
    deferred = q.defer()

    user = new User(
      fbId:         profile.id
      name:         profile.displayName
      gender:       profile.gender
      fbPictureUrl: profile.photos[0].value.replace /_.\.(.+)/, '_n.$1'
      fbLocationId: fbLocationId
    )

    userRepository.saveUser(user).then (user) ->
      userRepository.addMatchToUsers(user.id, user.gender).then (numUpdatedUsers) ->
        userRepository.addMatchesToUser(user.id, user.gender).then (numUpdatedUsers) ->
          deferred.resolve user

    deferred.promise

module.exports = UserService