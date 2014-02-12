expressConfig = require './express-config'
webappRouter  = require '../webapp/webapp-router'

exports.configure = ->
  ENV = process.env.ENV

  app = expressConfig.configure ENV

  webappRouter.setUpRoutes app

  app