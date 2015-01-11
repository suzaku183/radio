$ ->
	

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)

	play = $("#play")
	use = $("#use")

	#Peerオブジェクトの生成
	peer = new Peer({key: 'ca99fd4a-8e43-11e4-b490-ff1e952f2799'})

	socket = io.connect()
	console.log util.supports.data
	if util.supports.data
		use.text("You can use.")
	else
		use.text("You can not use.")
	

	peer.on("open",(id)->
		console.log	"お客様のIDは#{id}です"
		
		play.on("click",->
			socket.emit("call",id)
		)

		peer.on("call",(call)->
			call.answer()

			call.on("stream",(remote_stream)->
				$("#tuned").text("Tuned")
				
				audio = document.querySelector("#audio")
				audio.src = window.URL.createObjectURL(remote_stream)
				audio.play()
				
			)
		)
	)
