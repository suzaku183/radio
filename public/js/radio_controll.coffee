$ ->
	peer = new Peer({key: "6165842a-5c0d-11e3-b514-75d3313b9d05"})
	play = $("#play")
	socket = io.connect()
	

	play.on("click",->
		socket.emit("call",id)
	)
