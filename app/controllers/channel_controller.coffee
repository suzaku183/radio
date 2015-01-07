Base = require("./base_controller")["Base"]


class Channel
	
	@index:(req,res)->
		console.log "CHANNEL#INDEX"
		path = "channel/index"
		Base.render(res,path,{
			page_title: "チャンネル一覧",
			id: "unegi"
		})
	
	@mari: (req,res)->
		path = "mari/index.jade"

		Base.render(res,path,{
			page_title: "うねぎまりチャンネル"
		})


exports.Channel = Channel
