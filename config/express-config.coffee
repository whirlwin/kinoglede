crypto  = require 'crypto'
express = require 'express'
path    = require 'path'
pkg     = require '../package'

class ExpressConfig
  configure: (ENV) ->
    APP_ROOT = path.join __dirname, '../'
    app = express()
    app.set 'port', pkg.config.port
    app.set 'views', APP_ROOT + 'webapp'
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.json()
    app.use express.urlencoded()
    app.use express.methodOverride()
    app.use express.cookieParser(crypto.randomBytes(20).toString 'hex')
    app.use express.session()
    app.use require('stylus').middleware(APP_ROOT + 'public')
    app.use express.static(APP_ROOT + 'public')
    app.use app.router
    app.use express.errorHandler() if ENV == 'development'
    app

module.exports = ExpressConfig