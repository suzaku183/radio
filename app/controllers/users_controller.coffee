Base = require("./base_controller.coffee")["Base"]

class Users extends Base
	
	constructor: (req,res)->
		super(req,res)

	index: ->
		@render	{
			title: "ユーザーページ"
		}
	
	create: (query)->
		console.log query
		@redirect("/")

	new: ->
		@render {
			title: "NEW"
		}



exports.Users =  Users
