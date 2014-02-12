ApiRouter     = require '../api/api-router'
ExpressConfig = require './express-config'
WebappRouter  = require '../webapp/webapp-router'

class AppConfig

  expressConfig = new ExpressConfig()
  apiRouter     = new ApiRouter()
  webappRouter  = new WebappRouter()

  configure: ->
    ENV = process.env.ENV
    app = expressConfig.configure ENV

    apiRouter.setUpRoutes app
    webappRouter.setUpRoutes app

    app

module.exports = AppConfig