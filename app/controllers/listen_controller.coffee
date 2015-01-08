Base = require("./base_controller.coffee")["Base"]

class Listen extends Base
	
	constructor: (req)->
		super(req)


	unegi:  ->
		return {
			title: "うねぎまりのうねぎチャンネル！"
		}
			



exports.Listen = Listen
