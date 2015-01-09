fs = require "fs"
_ = require "underscore"

class Helper

	constructor: ->

	
	#404 not foundページを表示するための関数
	e404:->
		fs.readFileSync("./public/404.html","utf8")
	#500 Server errorページを表示するための関数
	e500:->
		fs.readFileSync("./public/500.html","utf8")
	
	#Debugs
	request_debug: (req)->
		console.log req.url
		console.log req.method
	
		
	#第一引数にクラス、第二引数にメソッドを設置することで動的に命令を呼び出す
	router: (c,controller,req,res)->
		temp = new c[controller](req,res)
		return temp

	#先頭だけ大文字にする関数
	capitalize:  (str) ->
		str.charAt(0).toUpperCase() + str.slice(1)

exports.Helper = Helper
