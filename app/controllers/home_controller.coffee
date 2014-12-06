Base = require("./base_controller")["Base"]


class Home extends Base
	@index:(req)->
		console.log "Deleyed proccess 10s ago"
		Base.createHash()

		return {
			path: "home/index.jade",
			page_title: 'This is Node top page',
			call_var: "Say var!!",
			hash: Base.createHash(),
			parts: "Somethins"
		}


exports.Home = Home
