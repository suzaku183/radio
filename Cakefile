_ = require "underscore"

task "routes","Show all routings" ,->
	routes = require "./config/routes.json"
	for f,data of routes
		for controller,funcs of data
			for func,info of funcs
				if info[0] == "get"
					console.log ":#{info[0]}	##{controller}##{func}=> #{if info[1]? then "/#{controller}/##{info[1]}/#{func}" else "/#{controller}/#{func}"}"
				else
					console.log ":#{info[0]}	##{controller}##{func}=> #{if info[1]? then "/#{controller}/##{info[1]}" else "/#{controller}"}"

