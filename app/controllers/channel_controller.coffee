Base = require("./base_controller")["Base"]


class Channel extends Base
	
	constructor:(req)->
		super(req)

	index:->
		return {
			page_title: "チャンネル一覧",
			id: "unegi"
		}
	


exports.Channel = Channel
