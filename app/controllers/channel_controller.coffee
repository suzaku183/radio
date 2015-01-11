Base = require("./base_controller")["Base"]


class Channel extends Base
	
	constructor:(req,res)->
		super(req,res)

	index:->
		@option.id = "unegi"
		@option.title += "チャンネル"
		@render(@option)


exports.Channel = Channel
