passport = require 'passport'

class FacebookController

  authenticate: ->
    passport.authenticate('facebook')

  authenticationCallback: ->
    passport.authenticate('facebook', successRedirect: '/', failureRedirect: '/fail')

module.exports = new FacebookController()