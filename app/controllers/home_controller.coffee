Base = require("./base_controller.coffee")["Base"]


class Home extends Base

	constructor: (req,res)->
		super(req,res)
		
	index: ->
		@render({
			title: "PAGE TOP NEW"
		})

exports.Home = Home
