Base = require("./base_controller.coffee")["Base"]


class Home extends Base

	constructor: (req,res)->
		super(req,res)
		
		
	index: ->
		@render(@option)

exports.Home = Home
