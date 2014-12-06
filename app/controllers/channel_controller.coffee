Base = require("./base_controller")["Base"]


class Channel extends Base
	@index:(req)->
		console.log "Called channel page"

		return {
			path: "channel/index.jade",
			page_title: 'チャンネル一覧'
		}


exports.Channel = Channel
