IndexController = require './index-controller'

class WebappRouter

  indexController = new IndexController()

  setUpRoutes: (app) ->
    app.get '/', indexController.index

module.exports = WebappRouter