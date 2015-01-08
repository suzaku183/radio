Base = require("./base_controller")["Base"]

class Company extends Base
	
	constructor: (req,res)->
		super(req,res)

	index: ->
		@render  {
			title: "運営について"
		}

	
	privacy: ->
		@render {
			title: "プライバシーポリシー"
		}

exports.Company = Company
