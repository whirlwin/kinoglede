passport       = require 'passport'
PageController = require './page-controller'
UserController = require './user/user-controller'

class WebappRouter

  pageController = new PageController()
  userController = new UserController()

  setUpRoutes: (app) ->
    app.get    '/users',                    userController.findMatchingUsers
    app.put    '/users/:userId',            userController.updateUser
    app.delete '/users/me/matches/:userId', userController.rejectMatch
    app.get    '/partials/:name',           pageController.getPartial
    app.get    '/auth/facebook',            passport.authenticate('facebook')
    app.get    '/auth/facebook/callback',   passport.authenticate('facebook', successRedirect: '/', failureRedirect: '/fail')
    app.post   '/users/me/session',         pageController.signOutUser
    app.get    '/users/me',                 pageController.getSignedInUser
    app.get    '/*',                        pageController.index

module.exports = WebappRouter