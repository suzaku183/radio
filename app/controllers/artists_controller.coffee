Base = require("./base_controller.coffee")["Base"]

class Artists extends Base
	
	constructor:(req,res) ->
		super(req,res)

	unegi:->
		@render {
			title: "うねぎまり：アーティスト紹介"
		}



exports.Artists = Artists
