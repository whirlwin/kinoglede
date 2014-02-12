crypto  = require 'crypto'
express = require 'express'
path    = require 'path'
pkg     = require '../package'

class ExpressConfig
  configure: (ENV) ->
    app = express()
    app.set 'port', pkg.config.port
    app.set 'views', path.join(__dirname, '../webapp/views')
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.json()
    app.use express.urlencoded()
    app.use express.methodOverride()
    app.use express.cookieParser(crypto.randomBytes(20).toString 'hex')
    app.use express.session()
    app.use app.router
    app.use require('stylus').middleware(path.join __dirname, 'public')
    app.use express.static(path.join __dirname, 'public')
    app.use express.errorHandler() if ENV == 'development'
    app

module.exports = ExpressConfig