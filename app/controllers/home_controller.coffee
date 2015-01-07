Base = require("./base_controller.coffee")["Base"]

class Home
	
	@index:(req,res)->
		console.log "Called top page"
		path = "home/index.jade"

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
