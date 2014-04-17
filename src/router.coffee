passport        = require 'passport'
indexController = require './index-controller'
movieController = require './movie/movie-controller'
userController  = require './user/user-controller'

class Router

  setUpRoutes: (app) ->
    app.get    '/movies',                    movieController.getMovies
    app.get    '/users',                    userController.findMatchingUsers
    app.put    '/users/:userId',            userController.updateUser
    app.delete '/users/me/matches/:userId', userController.rejectMatch
    app.post   '/users/me/session',         indexController.signOutUser
    app.get    '/users/me',                 indexController.getSignedInUser
    app.get    '/auth/facebook',            passport.authenticate('facebook')
    app.get    '/auth/facebook/callback',   passport.authenticate('facebook', successRedirect: '/', failureRedirect: '/fail')
    app.get    '/partials/:name',           indexController.getPartial
    app.get    '/*',                        indexController.index

module.exports = new Router()