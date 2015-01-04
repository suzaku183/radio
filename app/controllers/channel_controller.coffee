Base = require("./base_controller")["Base"]


class Channel
	
	@index:(res,req)->
		console.log "Accessed Channel page"
		
		Base.redirect_to res,"/"
		
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
