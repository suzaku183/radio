$ ->
	

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)
	


	#Peerオブジェクトの生成
	peer = new Peer({key: "6165842a-5c0d-11e3-b514-75d3313b9d05"})
	socket = io.connect()
	
	peer.on("open",(id)->
		
		console.log	id
		
		
		socket.emit("call",id)

		peer.on("call",(call)->
			call.answer()

			call.on("stream",(remote_stream)->
				console.log "Called"
				
				audio = document.querySelector("#audio")
				audio.src = window.URL.createObjectURL(remote_stream)
				audio.play()
				
			)
		)
	)
