Base = require("./base_controller")["Base"]
class Company extends Base
	
	constructor: ->
		console.log "カンパニークラスのコンストラクタが呼ばれたよ(´・ω・`)？`)"

	index: (req,res)->
		console.log "COMPANY#INDEX"
		path = "company/index"
		Base.render(res,path,{
			page_title: "運営について"
		})

	
	privacy: (req,res)->
		console.log "COMPANY#PRIVACY"
		path = "company/privacy"
		Base.render(res,path,{
			page_title: "プライバシーポリシー"
		})

exports.Company = Company
