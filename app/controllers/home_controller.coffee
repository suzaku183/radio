Base = require("./base_controller.coffee")["Base"]

class Home
	
	@index:(req)->
		console.log "Called top page"
		path = "home/index.jade"

		user = Base.model("user").find(1).then((user)->
			console.log user.dataValues
			return user.dataValues
		)
		return {
			path: path,
			user: user
		}

exports.Home = Home
