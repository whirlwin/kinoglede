class SessionController

  signOutUser: (req, res) ->
    req.logout()
    res.redirect '/'

  getSignedInUser: (req, res) ->
    if req.user
      res.send req.user
    else
      res.send 204

module.exports = new SessionController()