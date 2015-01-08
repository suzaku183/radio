Base = require("./base_controller")["Base"]

class Company extends Base
	
	constructor: (req)->
		super(req)


	index: ->
		return {
			page_title: "運営について"
		}

	
	privacy: ->
		return {
			page_title: "プライバシーポリシー"
		}

exports.Company = Company
