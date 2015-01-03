Base = require("./base_controller")["Base"]


class Home
	
	@index:(req)->
		console.log "Deleyed proccess 10s ago"

		return {
			path: "home/index.jade",
			page_title: 'This is Node top page',
			helper: Base
		}


exports.Home = Home
