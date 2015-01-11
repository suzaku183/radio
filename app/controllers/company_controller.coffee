Base = require("./base_controller")["Base"]

class Company extends Base
	
	constructor: (req,res)->
		super(req,res)

	index: ->
		@option.title = "運営チームについて"
		@render()

	
	privacy: ->
		@option.title = "プライバシーポリシー"
		@render()

exports.Company = Company
