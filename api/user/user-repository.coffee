mongoose = require 'mongoose'
q        = require 'q'

class UserRepository

  findOrSaveUser: (user) ->
    deferred = q.defer()

    console.log 'start user repo'
    user.save (err, user) ->
      if err
        console.log 'err::' + err
        deferred.reject err
      else
        console.log 'succ::' + user
        deferred.resolve user

    deferred.promise

module.exports = UserRepository