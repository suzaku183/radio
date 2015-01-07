Base = require("./base_controller.coffee")["Base"]

class Listen

	@index:(req,res) ->

	@unegi: (req,res) ->
		path = "listen/unegi"

		Base.render(res,path,{
			title: "うねぎまりのうねぎチャンネル！"
		})
			



exports.Listen = Listen
