IndexController = require './index-controller'

class ApiRouter

  indexController = new IndexController()

  setUpRoutes: (app) ->
    app.get '/api', indexController.index

module.exports = ApiRouter