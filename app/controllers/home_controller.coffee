Base = require("./base_controller.coffee")["Base"]


class Home extends Base

	constructor: (req)->
		super(req)

	index: ->
		return  {
			title: "TOP PAGE"
		}


		

exports.Home = Home
