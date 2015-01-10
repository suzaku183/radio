Base = require("./base_controller.coffee")["Base"]

class Users extends Base
	
	constructor: (req,res)->
		super(req,res)

	index: ->
		@render	{
			title: "ユーザーページ"
		}
	
	new: ->
		@model("user").find(1).then((user)->
			console.log user.dataValues
		)
		@render {
			title: "NEW"
		}


	create: (data)->
		data = @text_to_hash(data)
		console.log data
		redirect = @redirect

		if data
			@model("user").create(data).complete((err,user)->
				if err
					redirect("/users/new")
				redirect("/")
			)
		else
			@redirect("/")
	
	login: ->
		@render {
			title: "Login"
		}

	sign_in: (data)->
		set_cookie = @set_cookie
		redirect = @redirect
		pass = @hash(data.password)

		@model("user").find({where: {
			email: data.email
		}}).then((user)->
			if user?
				user = user.dataValues
				delete user.createdAt
				delete user.updatedAt
				delete user.password

				set_cookie("user",user)
				redirect("/")
			else
				console.log "User cannot found"
				redirect("/")
		)
	

exports.Users =  Users
