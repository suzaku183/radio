$ ->
	

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)

	socket = io.connect()
	play = $("#play")
	mute = $("#mute")
	use = $("#use")
	audio = ("#audio")
	
	#ラジオが始まる前の挙
	play.hide()
	#mute.hide()
	

	socket.on("started_radio",(data)->
		play.fadeIn("slow")
	)

	socket.emit("was_started_radio",true)
	
	socket.on("radio_propety",(data)->
		console.log if data then "現在配信中のラジオがあります" else "現在配信中のサービスはなし"
		if data
			play.fadeIn("slow")
	)

	if util.supports.data
		use.text("You can use.")
	else
		use.text("You can not use.")

	#Peerオブジェクトの生成
	peer = new Peer({key: 'ca99fd4a-8e43-11e4-b490-ff1e952f2799'})

	

	peer.on("open",(id)->
		#console.log	"お客様のIDは#{id}です"
		
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

