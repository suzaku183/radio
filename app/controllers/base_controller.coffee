jade = require "jade"
fs = require("fs")
fm = require("formidable")
qs = require "querystring"
_ = require("underscore")
cookie = require("cookie")
helper = require("../helper/index.coffee")
routes = require("../../config/routes")["routes"]
crypto = require "crypto"
model = require("../models/base_model.coffee")["models"]




#すべてのクラスが継承するべきコントローラー
class Base
	
	#Constructor
	constructor: (@req,res)->
		
		MAXTIME = 60 * 60 * 24
		DOMAIN = ""
		#Jadeファイルパスの設定
		@path = _set_path(@req.url)
		@cookie = _get_cookie(@req)
		
		
		#Cookieをセットする
		@set_cookie = (k,v,time=MAXTIME)->
			cookie_data = cookie.serialize(k,v,{
				path: "/",
				#secure: true,
				#domain: DOMAIN,
				maxAge: time #Cookieの最大有効時間を１日にする
			})
			res.setHeader("Set-Cookie",cookie_data)
			console.log "Setted cookie!"
		

		#データベースのモデルたち
		@model= (column)->
			return model[column]
		
		#Jadeをレンダリングするためのコード
		@render = (option) ->
			path = "#{__dirname}/../views/#{@path}.jade"
			option.pretty = true
			
			#View用のヘルパーメソッドです
			option.h = new helper.Helper
			
			#Render本体
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
		@hash= (text)->
			hash = crypto.createHash("sha512")
			hash = hash.update(text)
			hash = hash.digest("base64")
			return hash
		
		@text_to_hash = (data)->
			if @same_pass(data)
				data.password = @hash(data.password)
				delete data["password_confirm"]
				return data
			else
				return false

		@same_pass= (data)->
			if data.password == data.password_confirm then true else false

		#第一引数に与えられたパスにジャンプする
		@redirect= (path) ->
			res.writeHead(302,{
				Location: path
			})
			res.end()


	#URLからファイルパスを推測するメソッド
	_set_path= (url)->
		return "#{routes[url][0]}/#{routes[url][1]}"
		
	#RequestにCookieが含まれていた場合取りだしてインスタンス変数に格納するプライベートメソッド
	_get_cookie = (req)->
		if req.headers.cookie?
			return cookie.parse(req.headers.cookie)


	#Postデータを解析する
	@post_data: (req) ->
		req_body = ""
		req.on("data",(data)->
			req_body += data
		).on("end",->
			console.log req_body
		)



	

	#パスワードが一致するかを検証する
	#正しければTrueをそうでなければfalseを返す
	#まだ策定段階。第２引数に渡すものを検証中
	@password_auth: (pass,user) ->
		hash = crypto.createHash("sha512")
		hash = hash.update(pass)
		hash = hash.digest("base64")

		if user.email == hash then true else false
	

	
	
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

