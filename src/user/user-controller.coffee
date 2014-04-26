userService = require './user-service'

class UserController

  findMatchingUsers: (req, res) ->
    userService.findMatchingUsers(req.query.currentUserId).then (users) ->
      res.send users

  updateUser: (req, res) ->
    res.send 200

  rejectMatch: (req, res) ->
    userService.rejectMatch(req.user.id, req.params.userId).then ->
      res.send 200

  addMovie: (req, res) ->
    userService.addMovie(req.user.id, req.params.movieId).then ->
      res.send 200

  moveMovie: (req, res) ->
    userService.moveMovie(req.user.id, req.params.movieId, req.query.direction).then ->
      res.send 200

module.exports = new UserController()
