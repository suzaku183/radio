jade = require "jade"

process.on("message",(data) ->
	fn = jade.compile(data.source)
	html = fn(data.options)
	process.send html
)
