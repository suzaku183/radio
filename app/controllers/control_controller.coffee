Base = require("./base_controller.coffee")["Base"]

class Control extends Base
	
	constructor: (req)->
		super req

	index: (req,res)->
		path = "home/control"
		Base.render(res,path,{
			title: "管理ページ"
		})


exports.Control = Control
