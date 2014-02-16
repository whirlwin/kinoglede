PageController = require './page-controller'
passport = require 'passport'

class WebappRouter

  pageController = new PageController()

  setUpRoutes: (app) ->
    app.get '/partials/:name', pageController.getPartial
    app.get '/auth/facebook',  passport.authenticate('facebook')
    app.get '/auth/facebook/callback', passport.authenticate('facebook',
      successRedirect: '/', failureRedirect: '/fail')
    app.get '/*',              pageController.index

module.exports = WebappRouter