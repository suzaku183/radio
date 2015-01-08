Base = require("./base_controller.coffee")["Base"]

class Listen
	
	constructor: ->
		console.log "リッスンクラスのコンストラクタが呼ばれたよ(´・ω・`)？`)"

	index:(req,res) ->

	unegi: (req,res) ->
		path = "listen/unegi"

		Base.render(res,path,{
			title: "うねぎまりのうねぎチャンネル！"
		})
			



exports.Listen = Listen
