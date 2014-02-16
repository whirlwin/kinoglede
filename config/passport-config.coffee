credentials      = require '../credentials'
passport         = require 'passport'
passportFacebook = require 'passport-facebook'
UserService      = require '../api/user/user-service'

class PassportConfig

  FacebookStrategy = passportFacebook.Strategy
  userService = new UserService()

  configure: (app) ->

    do initialize = ->
      app.use passport.initialize()
      app.use passport.session()

    do configureConversion = ->
      passport.serializeUser (user, done) ->
        done null, user
      passport.deserializeUser (obj, done) ->
        done null, obj

    do configureFacebookStrategy = ->
      passport.use new FacebookStrategy(
        clientID:     credentials.facebook.clientID,
        clientSecret: credentials.facebook.clientSecret
        callbackURL:  'http://localhost:3000/auth/facebook/callback'
      ,(accessToken, refreshToken, profile, done) ->
        userService.findOrSaveUser(profile).then ->
          done null, profile
        .catch (err) ->
          done err
      )

module.exports = PassportConfig