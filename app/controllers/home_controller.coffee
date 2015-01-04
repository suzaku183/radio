Base = require("./base_controller")["Base"]

class Home
	
	@index:(req)->
		console.log "Deleyed proccess 10s ago"
		
		Base.model("user").create({
			name: "yuuji",
			email: "suzaku622@gmail.com"
		}).success(->
			console.log "User created"
		)

		return {
			path: "home/index.jade",
			page_title: 'This is Node top page',
			helper: Base
		}


exports.Home = Home
