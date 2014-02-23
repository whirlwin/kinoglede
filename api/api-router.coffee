ApiController  = require './api-controller'
UserController = require './user/user-controller'

class ApiRouter

  apiController  = new ApiController()
  userController = new UserController()

  setUpRoutes: (app) ->
    app.get '/api/users/matches', userController.findMatchingUsers
    app.get '/api/*',             apiController.handle404

module.exports = ApiRouter