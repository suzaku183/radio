$ ->
	

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)
	
	play = $("#play")

	#Peerオブジェクトの生成
	peer = new Peer({key: "ca99fd4a-8e43-11e4-b490-ff1e952f2799"})
	socket = io.connect()
	
	peer.on("open",(id)->
		
		console.log	id
		
		
		play.on("click",->
			console.log	"Clicked"

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
	)
