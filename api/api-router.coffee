indexController = require './index-controller'

exports.setUpRoutes = (app) ->
  app.get '/api', indexController.index