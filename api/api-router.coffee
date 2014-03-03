ApiController  = require './api-controller'
UserController = require './user/user-controller'

class ApiRouter

  apiController  = new ApiController()
  userController = new UserController()

  setUpRoutes: (app) ->
    app.get    '/api/users',                    userController.findMatchingUsers
    app.put    '/api/users/:userId',            userController.updateUser
    app.delete '/api/users/me/matches/:userId', userController.rejectMatch
    app.get    '/api/*',                        apiController.handle404

module.exports = ApiRouter