q                  = require 'q'
User               = require './user'
userRepository     = require './user-repository'
Location           = require './location/location'
locationRepository = require './location/location-repository'
matchService       = require './match/match-service'
movieService       = require '../movie/movie-service'

class UserService

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

  rejectMatch: (userId, matchUserId) -> matchService.rejectMatch userId, matchUserId

  addMovie: (userId, movieId) ->
    movieService.getMovie(movieId).then (movie) ->
      userRepository.addMovie userId, movieId if movie?

  moveMovie: (userId, movieId, direction) ->
    userRepository.findUser(_id: userId).then (user) ->
      userMovies = user.movies
      fromIndex = userMovies.indexOf movieId
      toIndex = if direction == 'up' then fromIndex - 1 else fromIndex + 1
      userMovies.splice toIndex, 0, userMovies.splice(fromIndex, 1)[0]
      userRepository.addMovies userId, userMovies,

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
      matchService.addMatchToUsers(user.id, user.gender).then (numUpdatedUsers) ->
        matchService.addMatchesToUser(user.id, user.gender).then (numUpdatedUsers) ->
          deferred.resolve user

    deferred.promise

module.exports = new UserService()