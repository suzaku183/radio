Base = require("./base_controller.coffee")["Base"]


class Home extends Base

	constructor: (req,res)->
		super(req,res)
		
		
	index: ->
		console.log @cookie.user
		@render({
			title: "夏風車 (*´∀｀*)"
		})

exports.Home = Home
