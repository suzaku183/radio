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

handler = (req,res) ->
	req.addListener("end",->
			
		#URLを解析する
		access_url = url.parse(req.url)
		url_path = access_url.path

		#リクエストが静的ファイルサーバに存在した場合はここから返す
		file_server.serve(req,res,(err,result) ->
			if routes[url_path]?
				try
					routes[url_path](req,res)
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

