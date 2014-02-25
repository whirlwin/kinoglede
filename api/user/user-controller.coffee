UserService = require './user-service'

class UserController

  userService = new UserService()

  findMatchingUsers: (req, res) ->
    userService.findMatchingUsers(req.query.userId).then (users) ->
      res.send users

  updateUser: (req, res) ->
    res.send 'OK'

module.exports = UserController