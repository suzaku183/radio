jade = require "jade"
fs = require("fs")
fm = require("formidable")
qs = require "querystring"
_ = require("underscore")
route = require "../../config/routes"
routes = route["routes"]
crypto = require "crypto"
model = require("../models/base_model.coffee")
model = model["models"]


#すべてのクラスが継承するべきコントローラー
class Base
	
	#Constructor
	constructor: (req)->
		#console.log "親クラスのコンストラクタが呼ばれたよ(´・ω・`)？`)"


	#URLからファイルパスを推測するメソッド
	@set_path: (req)->
		console.log "This is test function"



	#第一引数に与えられたパスにジャンプする
	@redirect: (path,res) ->
		res.writeHead(302,{
			Location: path
		})
		res.end()



	#Postデータを解析する
	@post_data: (req) ->
		req_body = ""
		req.on("data",(data)->
			req_body += data
		).on("end",->
			console.log req_body
		)


	#JADEをレンダリングするメソッド
	@render: (res,path,option) ->
		path = "#{__dirname}/../views/#{path}.jade"
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


	#暗号化するよ！
	@hash: ->
		hash = crypto.createHash("sha512")
		hash = hash.update("Helloworldiamyuuji")
		hash = hash.digest("base64")
		
		return hash
	

	#パスワードが一致するかを検証する
	#正しければTrueをそうでなければfalseを返す
	#まだ策定段階。第２引数に渡すものを検証中
	@password_auth: (pass,user) ->
		hash = crypto.createHash("sha512")
		hash = hash.update(pass)
		hash = hash.digest("base64")

		if user.email == hash then true else false
	

	#データベースのモデルたち
	@model: (column)->
		return model[column]
	
	
	#ログを取る関数
	@logger: (err)->
		path = "./logs/main.log"
		fs.appendFile(path,err,"utf8",(errors)->
			if errors
				console.log erroes
				err
		)

	#エラーを表記する関数
	@err_500: ->
		fs.readFileSync("./public/500.html","utf8")
	

exports.Base = Base

