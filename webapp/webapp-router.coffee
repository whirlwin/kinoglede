PageController = require './page-controller'

class WebappRouter

  pageController = new PageController()

  setUpRoutes: (app) ->
    app.get '/partials/:name', pageController.getPartial
    app.get '/*',              pageController.index

module.exports = WebappRouter