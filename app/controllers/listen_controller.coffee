Base = require("./base_controller.coffee")["Base"]

class Listen extends Base
	
	constructor: (req)->
		super(req)


	unegi: (req,res) ->
		Base.render(res,@path,{
			title: "うねぎまりのうねぎチャンネル！"
		})
			



exports.Listen = Listen
