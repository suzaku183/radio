fs = require "fs"
_ = require "underscore"

capitalize = (str) ->
	str.charAt(0).toUpperCase() + str.slice(1)

models = fs.readdirSync("./app/models/")
#console.log models
m = {}

_.each(models,(model)->
	model_name = model.split("_")[0]
	cap = capitalize(model_name)

	if !(model_name.match(/^\./)) && (model_name != "base")
		#console.log cap
		m[model_name] = require("./#{model}")[cap]
)


exports.models = m
