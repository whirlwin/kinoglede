appConfig = require './config/app-config'

class Server
  app = appConfig.configure()

  start: ->
    app.listen app.get('port')
    logger.info 'Express server listening on port ' + app.get('port')

new Server().start()