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