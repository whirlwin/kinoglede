UserService = require './user-service'

class UserController

  userService = new UserService()

  findMatchingUsers: (req, res) ->
    userService.findMatchingUsers(req.query.currentUserId).then (users) ->
      res.send users

  updateUser: (req, res) ->
    res.send 'OK'

  rejectMatch: (req, res) ->
    userService.rejectMatch(req.user.id, req.query.userId).then (val) ->

module.exports = UserController