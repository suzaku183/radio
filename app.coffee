_ = require "underscore"
http = require "http"
https = require "https"
fs = require "fs"
path = require "path"
url = require "url"
ns = require "node-static"
io = require "socket.io"
cp = require("child_process")
route = require "./config/routes"
routes = route["routes"]

#静的ファイルを配信するためのコード
file_server = new ns.Server("./public",{cache: 7200})

#404 not foundページを表示するための関数
err_404 = fs.readFileSync("./public/404.html","utf8")
#500 Server errorページを表示するための関数
err_500 = fs.readFileSync("./public/500.html","utf8")

#先頭だけ大文字にする関数
capitalize = (str) ->
	str.charAt(0).toUpperCase() + str.slice(1)

#Controllerが追加された段階で自動的にロードされる仕組み。
controllers = fs.readdirSync("#{__dirname}/app/controllers")
c = []
_.each(controllers,(v,k)->
	c_name = v.split("_")[0]
	if !(c_name.match(/^\./))
		c[c_name] = new require("./app/controllers/#{c_name}_controller")[capitalize(c_name)]
)

#第一引数にクラス、第二引数にメソッドを設置することで動的に命令を呼び出す
router = (controller,req)->
	temp = new c[controller](req)
	return temp


#メインの処理区画
handler = (req,res) ->
	req.addListener("end",->
		

		#URLを解析する
		access_url = url.parse(req.url)
		url_path = access_url.path

		#リクエストが静的ファイルサーバに存在した場合はここから返す
		file_server.serve(req,res,(err,result) ->
			if routes[url_path]?
				try
					pd = routes[url_path]
					render_html = router(pd[0],req)
					render_html[pd[1]](req,res)
					render_html = null
				catch e
					console.log e
					res.writeHead(500)
					res.end(err_500)
			else
				#Render 404 page not found
				res.writeHead(404)
				res.end(err_404)
		)
	).resume()


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
app.listen(3000)
console.log "Server is runnging"

