indexController = require './index-controller'

exports.setUpRoutes = (app) ->
  app.get '/', indexController.index