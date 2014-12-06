socket = io.connect()

socket.on("buffer",(data)->
	console.log data
)

