Base = require("./base_controller")["Base"]


class Channel extends Base
	@index:(req)->
		console.log "Called channel page"

		return {
			path: "channel/index.jade",
			page_title: 'チャンネル一覧'
		}
	
	@mari: (req)->
		return {
			path: "mari/index.jade",
			page_title: "うねぎまりチャンネル"
		}


exports.Channel = Channel
