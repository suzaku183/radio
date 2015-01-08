Base = require("./base_controller.coffee")["Base"]

class Control extends Base
	
	constructor: (req,res)->
		super req,res

	index: ->
		@path = "home/control"
		@render {
			title: "管理ページ "
		}

exports.Control = Control
