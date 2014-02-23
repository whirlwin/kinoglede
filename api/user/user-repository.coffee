q    = require 'q'
User = require './user'

class UserRepository

  findUser: (criteria) ->
    deferred = q.defer()
    User.findOne criteria, (err, user) ->
      if (err)
        deferred.reject err
      else
        deferred.resolve user
    deferred.promise

  findUsers: (criteria) ->
    deferred = q.defer()
    User.find criteria, (err, users) ->
      if (err)
        deferred.reject err
      else
        deferred.resolve users
    deferred.promise

  saveUser: (user) ->
    deferred = q.defer()
    user.save (err, user) ->
      if err
        deferred.reject err
      else
        deferred.resolve user
    deferred.promise

module.exports = UserRepository