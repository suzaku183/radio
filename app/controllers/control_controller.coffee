Base = require("./base_controller.coffee")["Base"]

class Control extends Base
	
	constructor: (req,res)->
		super req,res

	index: ->
		admin_mail = @cookie.admin_mail
		render = @render
		redirect = @redirect
		path = "control/index"
		

		if admin_mail?
			@model("user").find(where: {
				email: admin_mail
			}).then((user)->
				if user?
					user = user.dataValues
					render({title:"管理ページ",user: user},path)
				else
					console.log "この情報は管理者のものではない"
					redirect("/")
			)
		else
			console.log "クッキーが無かった"
			@redirect("/")


	login: ->
		console.log "Called login page"
		@path = "/control/login"
		@option.title = "管理ページはこちらから"
		@render @option
	
	sign_in: (data)->
		r = @redirect
		s_c = @set_cookie
		mail = data.email
		hash = @hash
	
		user = @model("user").find(where: {
			email: data.email,
			password: hash(data.password)
		}).then((user)->
			if user?
				user = user.dataValues
				s_c("admin_mail",user.email)
				r("/control")
			else
				r("/control/login")
		)

	logout: ->
		@set_cookie("admin_mail",null)
		@redirect "/"

exports.Control = Control
