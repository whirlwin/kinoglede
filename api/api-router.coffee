IndexController = require './index-controller'
UserService     = require './user/user-service'

class ApiRouter

  indexController = new IndexController()
  userService     = new UserService()

  setUpRoutes: (app) ->
    app.get '/api', indexController.index
    app.get '/api/test', userService.findOrSaveUser

module.exports = ApiRouter