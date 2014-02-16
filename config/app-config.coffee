ApiRouter      = require '../api/api-router'
ExpressConfig  = require './express-config'
PassportConfig = require './passport-config'
MongooseConfig = require './mongoose-config'
WebappRouter   = require '../webapp/webapp-router'

class AppConfig

  expressConfig  = new ExpressConfig()
  mongooseConfig = new MongooseConfig()
  passportConfig = new PassportConfig()
  apiRouter      = new ApiRouter()
  webappRouter   = new WebappRouter()

  configure: ->
    ENV = process.env.ENV

    app = expressConfig.configure ENV
    passportConfig.configure app
    mongooseConfig.configure()

    apiRouter.setUpRoutes app
    webappRouter.setUpRoutes app

    app

module.exports = AppConfig