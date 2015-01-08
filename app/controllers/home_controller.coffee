Base = require("./base_controller.coffee")["Base"]

class Home extends Base

	constructor: (req)->
		super(req)

	index: (req,res)->
		console.log "HOME#INDEX"
		path = "home/index"

		Base.render(res,path,{
			page_title: "This is top page",
		})


		

exports.Home = Home
