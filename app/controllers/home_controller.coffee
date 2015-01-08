Base = require("./base_controller.coffee")["Base"]

class Home extends Base
	
	constructor: (req)->
		super(req)
		console.log "小クラスのコンストラクタが呼ばれたよ(´・ω・`)？`)"

	index: (req,res)->
		console.log "HOME#INDEX"
		path = "home/index"

		user = Base.model("user").find(2).then((user)->
			if user?
				Base.render(res,path,{
					page_title: "This is top page",
					user: user.dataValue
				})
			else
				Base.render(res,path,{
					page_title: "This is top page"
				})
		)


		

exports.Home = Home
