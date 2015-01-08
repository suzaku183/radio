Base = require("./base_controller.coffee")["Base"]
formidable = require "formidable"
url = require "url"
qs = require "querystring"


class Users extends Base
	
	constructor: (req,res)->
		super(req,res)

	index: ->
		@render	{
			title: "ユーザーページ"
		}
	
	new: ->
		if @req.method == "GET"
			@render {
				title: "User new page"
			}

		else if req.method == "POST"
			form = new formidable.IncomingForm()
			form.parse(req,(err,fields,files)->
				console.log files
			)



exports.Users =  Users
