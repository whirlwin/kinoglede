passport           = require 'passport'
facebookController = require './auth/facebook-controller'
indexController    = require './index-controller'
movieController    = require './movie/movie-controller'
sessionController  = require './auth/session-controller'
userController     = require './user/user-controller'

class Router

  setUpRoutes: (app) ->
    app.get    '/movies',                   movieController.getMovies
    app.put    '/users/:userId',            userController.updateUser
    app.get    '/users/me',                 sessionController.getSignedInUser
    app.get    '/users/me/matches',         userController.findMatchingUsers
    app.delete '/users/me/matches/:userId', userController.rejectMatch
    app.post   '/users/me/movies/:movieId', userController.addMovie
    app.put    '/users/me/movies/:movieId', userController.moveMovie
    app.post   '/users/me/session',         sessionController.signOutUser
    app.get    '/auth/facebook',            facebookController.authenticate()
    app.get    '/auth/facebook/callback',   facebookController.authenticationCallback()
    app.get    '/partials/:name',           indexController.getPartial
    app.get    '/*',                        indexController.renderLayout

module.exports = new Router()