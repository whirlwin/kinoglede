userService = require './user-service'

class UserController

  findMatchingUsers: (req, res) ->
    userService.findMatchingUsers(req.query.currentUserId).then (users) ->
      res.send users

  updateUser: (req, res) ->
    res.send 'OK'

  rejectMatch: (req, res) ->
    userService.rejectMatch(req.user.id, req.params.userId).then ->
      res.send 'OK'

module.exports = new UserController()
