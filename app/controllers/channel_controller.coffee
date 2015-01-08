Base = require("./base_controller")["Base"]


class Channel extends Base
	
	constructor:(req,res)->
		super(req,res)

	index:->
		@render({
			id: "unegi",
			title:"Chennel page!"
		})


exports.Channel = Channel
