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

#Template engin
jade = require "jade"
jade_stream = require "jade-stream"


file_server = new ns.Server("./public",{cache: 7200})


#Error files
err_404 = fs.readFileSync("./public/404.html","utf8")
err_500 = fs.readFileSync("./public/500.html","utf8")


write_in_log = (data) ->
	_.each(data,(d) ->
		date = new Date()
		fs.appendFile('./logs/main.log', "#{date}: #{d} \n" ,'utf8',(err)->
		)
	)



handler = (req,res) ->
	req.addListener("end",->
			
		access_url = url.parse(req.url)
		url_path = access_url.path
	
		#Logの書き込み
		write_in_log(access_url)

		file_server.serve(req,res,(err,result) ->
			if routes[url_path]?
				
				try
					r = routes[url_path](req)
					r.pretty = true
				catch e
					console.log e
					write_in_log(["No property"])
					res.writeHead(500)
					res.end(err_500)

				#Write Log
				write_in_log(r)
				
				try
					f = ("#{__dirname}/app/views/#{r.path}")
					

					jade.renderFile(f,r,(jade_error,html)->
						if jade_error
							#Write Logs
							write_in_log(jade_error)
							
							#Render of the Error page about 500
							res.writeHead(500)
							res.write("Error from jade!")
							res.end(err_500)
						
						#Write logs
						write_in_log([200,"Page found!"])

						#Render Jade pages
						res.writeHead(200,{"Content-Type":"text/html"})
						res.end(html)
					)
				catch e
					console.log e
					write_in_log([500,"server error!"])
					res.writeHead(500)
					res.end(err_500)

			else
				#Write logs
				write_in_log([404,"Page not found"])

				#Render 404 page not found
				res.writeHead(404)
				res.end(err_404)
		)
	).resume()



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

