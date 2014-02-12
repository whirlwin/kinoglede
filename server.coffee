http      = require 'http'
AppConfig = require './config/app-config'

class Server
  app = new AppConfig().configure()

  start: ->
    http.createServer(app).listen(app.get('port'), ->
      console.log 'Express server listening on port ' + app.get('port')
    )

new Server().start()