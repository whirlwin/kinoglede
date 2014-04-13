passport         = require 'passport'
passportFacebook = require 'passport-facebook'
credentials      = require '../credentials'
UserService      = require '../src/user/user-service'

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
        clientID:     credentials.facebook.clientID
        clientSecret: credentials.facebook.clientSecret
        profileFields: ['displayName', 'name', 'gender','location', 'photos']
        callbackURL:  'http://localhost:3000/auth/facebook/callback'
      ,(accessToken, refreshToken, profile, done) ->
        userService.findOrSaveUser(profile).then (mongoUser) ->
          done null, getSessionUser(mongoUser)
        .catch (err) ->
          done err
      )

  getSessionUser = (mongoUser) ->
    mutableUser = mongoUser.toObject()
    mutableUser.id = mutableUser._id
    mutableUser

module.exports = PassportConfig