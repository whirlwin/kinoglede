mongoose = require 'mongoose'
q        = require 'q'
User     = require './user'

class UserRepository

  findOrSaveUser: (profile) ->
    deferred = q.defer()

    user = new User
      name:   profile.displayName
      gender: profile.gender

    user.save (err, user) ->
      if err
        deferred.reject err
      else
        deferred.resolve user

    deferred.promise

module.exports = UserRepository