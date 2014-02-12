apiRouter     = require '../api/api-router'
expressConfig = require './express-config'
webappRouter  = require '../webapp/webapp-router'

exports.configure = ->
  ENV = process.env.ENV

  app = expressConfig.configure ENV

  apiRouter.setUpRoutes app
  webappRouter.setUpRoutes app

  app