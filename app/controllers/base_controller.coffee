fs = require("fs")
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
	
	@logger: (err)->
		path = "./logs/main.log"
		fs.appendFile(path,err,"utf8",(errors)->
			if errors
				console.log erroes
				err
		)

exports.Base = Base

