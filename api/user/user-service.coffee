q              = require 'q'
UserRepository = require './user-repository'

class UserService

  userRepository = new UserRepository()

  findOrSaveUser: (profile) ->
    userRepository.findOrSaveUser profile

module.exports = UserService