http      = require 'http'
appConfig = require './config/app-config'

app = appConfig.configure()

http.createServer(app).listen(app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
)