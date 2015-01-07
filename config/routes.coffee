_ = require "underscore"
fs = require "fs"

capitalize = (str) ->
	str.charAt(0).toUpperCase() + str.slice(1)


#Controllerが追加された段階で自動的にロードされる仕組み。
controllers = fs.readdirSync("#{__dirname}/../app/controllers")
c = []
_.each(controllers,(v,k)->
	c_name = v.split("_")[0]
	if !(c_name.match(/^\./))
		c[c_name] = require("../app/controllers/#{c_name}_controller")[capitalize(c_name)]
)


#下にはルーティング記述する
routes = {
	"/": c["home"].index,
	"/listen/unegi": c["listen"].unegi,
	"/privacy": c["company"].privacy,
	"/foundation": c["company"].index,
	"/channels": c["channel"].index,
	"/channels/mari": c["channel"].mari,
	"/users": c["user"].index
	"/users/new": c["user"].new
}


exports.routes = routes
