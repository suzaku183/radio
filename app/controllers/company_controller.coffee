Base = require("./base_controller")["Base"]
class Company extends Base

	@index: ->
	
		return {
			path: "company/index.jade",
			page_title: "運営チームのご紹介"
		}




exports.Company = Company
