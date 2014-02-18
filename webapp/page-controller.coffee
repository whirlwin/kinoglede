passport = require 'passport'

class IndexController

  index: (req, res) ->
    res.render 'assets/views/layout'

  getPartial: (req, res) ->
    partialName = req.params.name
    res.render 'assets/views/partials/' + partialName, (err, html) ->
      if err
        res.send 404, 'Could not find partial with name: ' + partialName
      else
        res.end html

  logInWithFacebook: (req, res) ->
    passport.authenticate('facebook')

  onFacebookLoggedIn: (req, res) ->
    passport.authenticate('facebook',
      successRedirect: '/', failureRedirect: '/')

  signOutUser: (req, res) ->
    req.logout()
    res.redirect '/'

  getSignedInUser: (req, res) ->
    res.send req.user

module.exports = IndexController