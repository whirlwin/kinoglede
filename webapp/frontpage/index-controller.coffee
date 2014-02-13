class IndexController

  index: (req, res) ->
    res.render 'frontpage/layout'

module.exports = IndexController