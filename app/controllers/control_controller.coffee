Base = require("./base_controller.coffee")["Base"]

class Control extends Base
	
	constructor: (req,res)->
		super req,res

	index: ->
		if @cookie?
			console.log "Logged in"
			@path = "home/control"
			@render {
				title: "管理ページ "
			}
		else
			console.log "Cookie has not"
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

		user = @model("user").find(where: {
			email: data.email
		}).then((user)->
			if user?
				user = user.dataValues
				s_c("user_mail",user.email)
				r("/control")
			else
				r("/control/login")
		)

	logout: ->
		@cookie.user_mail = null
		@redirect "/"

exports.Control = Control
