passport = require 'passport'

class IndexController

  renderLayout: (req, res) ->
    res.render 'assets/views/layout'

  getPartial: (req, res) ->
    partialName = req.params.name
    res.render 'assets/views/partials/' + partialName, (err, html) ->
      if err
        res.send 404, 'Could not find partial with name: ' + partialName
      else
        res.end html

  handle404: (req, res) ->
    res.send 404, 'Not found'

module.exports = new IndexController()