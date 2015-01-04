Base = require("./base_controller")["Base"]
class Company extends Base

	@index: (req,res)->
		path = "company/index.jade"
		Base.render(res,path,{
			page_title: "運営について"
		})



exports.Company = Company
