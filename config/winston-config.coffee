winston = require 'winston'

class WinstonConfig

  configure: ->
    GLOBAL.logger = new winston.Logger
      transports: [
        new winston.transports.Console
          colorize: true
        new winston.transports.File
          filename: 'logs/server.log'
      ]

module.exports = new WinstonConfig()