class IndexController

  index: (req, res) ->
    res.send {foo: 'bar'}

module.exports = IndexController