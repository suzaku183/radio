jade = require "jade"
fs = require("fs")
route = require "../../config/routes"
routes = route["routes"]
model = require("../models/base_model.coffee")
model = model["models"]

#すべてのクラスが継承するべきコントローラー
class Base

	#CSRF対策用のメソッド
	#ランダムな文字列を生成して他のブラウザからの怪しい攻撃かどうかを見極める
	@create_hash:->
		return "guivgbyo84bt5rwi782yw9dugbc478otwevxfywbowqv"
	
	@redirect_to: (res,path) ->
		res.writeHead(302,{
			Location: path
		})
		res.end()


	@model: (column)->
		#console.log model[column]
		return model[column]
	

	@render: (res,path,option) ->
		path = "#{__dirname}/../views/#{path}"
		option.pretty = true
		jade.renderFile(path,option,(err,html)->
			if err
				#エラーページのログを記述
				console.log err
				res.writeHead(500)
				res.end(@err_500)
			
			#JADEページを表示する
			res.writeHead(200,{"Content-Type":"text/html"})
			res.end(html)
		)

	@logger: (err)->
		path = "./logs/main.log"
		fs.appendFile(path,err,"utf8",(errors)->
			if errors
				console.log erroes
				err
		)
	@err_500: ->
		fs.readFileSync("./public/500.html","utf8")
	

exports.Base = Base

