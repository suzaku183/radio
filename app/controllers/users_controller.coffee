Base = require("./base_controller.coffee")["Base"]
formidable = require "formidable"
url = require "url"
qs = require "querystring"

class Users extends Base
	
	constructor: (req)->
		super(req)

	index: (req,res)->
		Base.render(res,@path,{
			page_title: "This is users page"
		})

	new: (req,res) ->
		if req.method == "GET"
			Base.render(res,@path,{
				page_title: "User new page"
			})

		else if req.method == "POST"
			form = new formidable.IncomingForm()
			form.parse(req,(err,fields,files)->
				console.log files
			)



exports.Users =  Users
