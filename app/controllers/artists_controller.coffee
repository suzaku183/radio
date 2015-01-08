Base = require("./base_controller.coffee")["Base"]

class Artists extends Base
	
	constructor:(req) ->
		super(req)

	unegi: (req,res)->
		Base.render(res,@path,{
			title: "うねぎまり：アーティスト紹介"
		})



exports.Artists = Artists
