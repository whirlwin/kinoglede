expressConfig  = require './express-config'
mongooseConfig = require './mongoose-config'
passportConfig = require './passport-config'
router         = require '../src/router'

class AppConfig

  configure: ->
    ENV = process.env.ENV

    app = expressConfig.configure ENV
    passportConfig.configure app
    mongooseConfig.configure()

    router.setUpRoutes app

    app

module.exports = new AppConfig()