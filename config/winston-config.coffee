fs      = require 'fs'
winston = require 'winston'

class WinstonConfig

  LOG_FILE = 'logs/server.log'

  configure: ->
    handleCreateLogFile()

    GLOBAL.logger = new winston.Logger
      transports: [
        new winston.transports.Console
          colorize: true
        new winston.transports.File
          filename: LOG_FILE
      ]

  handleCreateLogFile = ->
    fs.openSync LOG_FILE, 'a+'

module.exports = new WinstonConfig()