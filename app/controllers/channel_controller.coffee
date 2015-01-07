Base = require("./base_controller")["Base"]


class Channel
	
	@index:(req,res)->
		console.log "CHANNEL#INDEX"
		path = "channel/index"

	
	@mari: (req,res)->
		path = "mari/index.jade"

		Base.render(res,path,{
			page_title: "うねぎまりチャンネル"
		})


exports.Channel = Channel
