Base = require("./base_controller.coffee")["Base"]

class Listen extends Base
	
	constructor: (req,res)->
		super(req,res)

	unegi: ->
		@render {
			title: "うねぎまりのうねぎチャンネル！"
		}
			



exports.Listen = Listen
