mongoose = require 'mongoose'
q        = require 'q'
User     = require './user'

class UserRepository

  ObjectId = mongoose.Types.ObjectId

  findUser: (criteria) ->
    deferred = q.defer()
    User.findOne criteria, (err, user) ->
      if (err)
        console.error err
        deferred.reject err
      else
        deferred.resolve user
    deferred.promise

  findUsers: (criteria) ->
    deferred = q.defer()
    User.find criteria, (err, users) ->
      if (err)
        console.error err
        deferred.reject err
      else
        deferred.resolve users
    deferred.promise

  saveUser: (user) ->
    deferred = q.defer()
    user.save (err, user) ->
      if err
        console.error err
        deferred.reject err
      else
        deferred.resolve user
    deferred.promise

  addMatchToUsers: (userId, gender) ->
    deferred = q.defer()
    User.update (_id: ($ne: userId), gender: gender), ($push: matchingUserIds: userId), (err, numUpdatedUsers) ->
      if err
        console.error err
        deferred.reject err
      else
        deferred.resolve numUpdatedUsers
    deferred.promise

  addMatchesToUser: (userId, gender) ->
    deferred = q.defer()
    User.find _id: ($ne: userId), gender: gender, (err, users) ->
      if err
        console.error err
        deferred.reject err
      else
        userIds = users.map (user) ->
          user.id
        User.update (_id: userId), ($pushAll: matchingUserIds: userIds), (err, numUpdatedUsers) ->
          if err
            console.error err
            deferred.reject err
          else
            deferred.resolve numUpdatedUsers
    deferred.promise

  deleteMatch: (userId, matchUserId) ->
    deferred = q.defer()
    User.update (_id: userId), $pull: (matchingUserIds: matchUserId), (err) ->
      if err
        console.error err
        deferred.reject err
      else
        deferred.resolve()
    deferred.promise

  addMovie: (userId, movieId) ->
    deferred = q.defer()
    User.update (_id: userId), $push: (movies: movieId), (err) ->
      if err
        console.error err
        deferred.reject err
      else
        deferred.resolve()
    deferred.promise

module.exports = new UserRepository()