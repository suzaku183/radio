Base = require("./base_controller.coffee")["Base"]

class Control
	
	@index: (req,res)->
		path = "home/control"
		Base.render(res,path,{
			title: "管理ページ"
		})


exports.Control = Control
