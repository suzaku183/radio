socket = io.connect()


context = new window.AudioContext()

socket.on("send_audio",(data) ->
	length = data.byteLength
	load = new Float32Array(length)
	console.log load
)
