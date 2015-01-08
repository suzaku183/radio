Base = require("./base_controller")["Base"]


class Channel extends Base
	
	constructor:(req)->
		super(req)

	index:(req,res)->
		console.log "CHANNEL#INDEX"
		Base.render(res,@path,{
			page_title: "チャンネル一覧",
			id: "unegi"
		})
	


exports.Channel = Channel
