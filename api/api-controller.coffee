class ApiController

  handle404: (req, res) ->
    res.send 404, 'Not found'

module.exports = ApiController