_ = require "underscore"
http = require "http"
https = require "https"
fs = require "fs"
path = require "path"
url = require "url"
ns = require "node-static"
io = require "socket.io"
cookie = require("cookie")
cp = require("child_process")
qs = require("querystring")
route = require "./config/routes"
routes = route["routes"]
helper = new (require("./lib/helper.coffee"))["Helper"]


#静的ファイルを配信するためのコード
file_server = new ns.Server("./public",{cache: 7200})


#Controllerが追加された段階で自動的にロードされる仕組み。
controllers = fs.readdirSync("#{__dirname}/app/controllers")
c = []
_.each(controllers,(v,k)->
	c_name = v.split("_")[0]
	if !(c_name.match(/^\./))
		c[c_name] = new require("./app/controllers/#{v}")[helper.capitalize(c_name)]
)


#Node-staticの処理をまとめた関数
ns_file_server = (req,res,url_path,posts)->
	#Server用のHELPERクラス
	#helper.request_debug(req)
	
	#リクエストが静的ファイルサーバに存在した場合はここから返す
	file_server.serve(req,res,(err,result) ->
	
		if routes[url_path]?
			try
				path_data = routes[url_path]

				#クラスのインスタンスを作成とメソッド呼び出し
				html = helper.router(c,path_data[0],req,res)
				html[path_data[1]](posts)

				#インスタンス変数を削除する
				html = null
			catch e
				console.log e
				res.writeHead(500)
				res.end(helper.e500())
		else
			#Render 404 page not found
			res.writeHead(404)
			res.end(helper.e404())
	)


#メインの処理区画
handler = (req,res) ->

	#URLを解析する
	access_url = url.parse(req.url)
	url_path = access_url.path
	
	#改善策があれば短くしたいと思う
	switch req.method
		when "GET"
			req.on("end",->
				ns_file_server(req,res,url_path)
			).resume()
		when "POST"
			d = ""
			req.on("data",(data)->
				d += data
			).on("end",->
				posts = qs.parse(d)
				ns_file_server(req,res,url_path,posts)
			).resume()
		else
			console.log "未定義のHTML METHODでアクセスしてきました"
			helper.e500()

	
#サーバーを稼働させる
app = http.createServer(handler)


#Write about process around socket.io
serve_io = io.listen(app)
serve_io.sockets.on("connection",(socket) ->
	
	socket.on("audio",(data) ->
		console.log data
		socket.broadcast.emit("send_audio", data)
	)
	
	socket.on("call",(id)->
		console.log id
		socket.broadcast.emit("recive_listener",id)
	)

	
)

#Server runging command
app.listen(80)
console.log "щ(ﾟдﾟщ)ｶﾓｰﾝ"

