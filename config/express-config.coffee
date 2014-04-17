cookieParser   = require 'cookie-parser'
crypto         = require 'crypto'
express        = require 'express'
expressSession = require 'express-session'
errorhandler   = require 'errorhandler'
methodOverride = require 'method-override'
morgan         = require 'morgan'
path           = require 'path'
stylus         = require 'stylus'
env            = require '../env'

class ExpressConfig
  configure: (ENV) ->
    APP_ROOT = path.join __dirname, '../'
    app = express()
    app.set 'port', env.port
    app.set 'views', APP_ROOT
    app.set 'view engine', 'jade'
    app.use morgan('dev')
    app.use methodOverride()
    app.use cookieParser(crypto.randomBytes(20).toString 'hex')
    app.use expressSession()
    app.use express.static(APP_ROOT + 'assets')
    app.use stylus.middleware(APP_ROOT + 'assets/styles')
    app.use errorhandler()

    unless env.compressed
      app.locals.pretty = true

    app

module.exports = new ExpressConfig()