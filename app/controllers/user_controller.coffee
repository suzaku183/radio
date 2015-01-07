Base = require("./base_controller.coffee")["Base"]
qs = require("querystring")

class User

	@index: (req,res)->
		console.log "USER#INDEX"
		path = "users/index"

		if req.method == "POST"
			console.log req.method
			
			req_body = ""
			req.on("data",(data)->
				console.log data
			)


		else if req.method == "GET"
			Base.render(res,path,{
				page_title: "This is users page"
			})

	@new: (req,res) ->
		console.log "USER#NEW"
		path = "users/new"
		Base.render(res,path,{
			page_title: "User new page"
		})
	

exports.User =  User
