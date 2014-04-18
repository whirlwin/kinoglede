morgan         = require 'morgan'
expressConfig  = require './express-config'
winstonConfig  = require './winston-config'
mongooseConfig = require './mongoose-config'
passportConfig = require './passport-config'
router         = require '../src/router'

class AppConfig

  configure: ->
    app = expressConfig.configure()
    winstonConfig.configure()
    passportConfig.configure app
    mongooseConfig.configure()

    router.setUpRoutes app

    app

module.exports = new AppConfig()