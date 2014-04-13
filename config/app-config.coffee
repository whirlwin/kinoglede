ExpressConfig  = require './express-config'
MongooseConfig = require './mongoose-config'
PassportConfig = require './passport-config'
WebappRouter   = require '../src/router'

class AppConfig

  expressConfig  = new ExpressConfig()
  mongooseConfig = new MongooseConfig()
  passportConfig = new PassportConfig()
  webappRouter   = new WebappRouter()

  configure: ->
    ENV = process.env.ENV

    app = expressConfig.configure ENV
    passportConfig.configure app
    mongooseConfig.configure()

    webappRouter.setUpRoutes app

    app

module.exports = AppConfig