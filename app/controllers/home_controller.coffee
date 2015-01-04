Base = require("./base_controller.coffee")["Base"]

class Home
	
	@index:(req,res)->
		console.log "Called top page"
		path = "home/index.jade"

		user = Base.model("user").find(1).then((user)->
			Base.render(res,path,{
				user: user.dataValues
			},req)
		)

exports.Home = Home
