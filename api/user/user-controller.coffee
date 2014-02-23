UserService = require './user-service'

class UserController

  userService = new UserService()

  findMatchingUsers: (req, res) ->
    userService.findMatchingUsers(req.query.userId).then (users) ->
      res.send users

module.exports = UserController