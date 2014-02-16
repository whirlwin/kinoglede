ApiRouter      = require '../api/api-router'
ExpressConfig  = require './express-config'
MongooseConfig = require './mongoose-config'
WebappRouter   = require '../webapp/webapp-router'

class AppConfig

  expressConfig  = new ExpressConfig()
  mongooseConfig = new MongooseConfig()
  apiRouter      = new ApiRouter()
  webappRouter   = new WebappRouter()

  configure: ->
    ENV = process.env.ENV
    app = expressConfig.configure ENV
    mongooseConfig.configure()

    apiRouter.setUpRoutes app
    webappRouter.setUpRoutes app

    app

module.exports = AppConfig