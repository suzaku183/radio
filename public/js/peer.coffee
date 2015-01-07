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

	
	peer.on("open",(id)->


		

		$("#peer_id").text(id)
		

		#この下に音声接続のコードを書く
		#ボタンを押された時に動作するようにする
		$("#send").on("click",->
			id = $("#form_id").val()
			
			
			navigator.getUserMedia({audio: true},
				(stream)->
					audio = document.querySelector("#audio")
					audio.src = window.URL.createObjectURL(stream)
					#audio.play()

					console.log "Start broad cast"
					call = peer.call(id,stream)

				,(err)->
					console.log err
			)

		)

	)
	
	#相手からの音声接続に対して
	peer.on("call",(call)->
		call.answer()
		call.on("stream",(remote_stream)->
			console.log "Audio connected"

			#$("#audio").prop("src",window.URL.createObjectURL(remote_stream))
			
			audio = document.querySelector("#audio")
			audio.src = window.URL.createObjectURL(remote_stream)
			audio.play()
			
			
			$("#d_call").on("click",->
				d_id = $("#d_form").val()
				console.log "Second clicked : #{d_id}"

				call = peer.call(d_id,remote_stream)
			)

			console.log remote_stream
		)
	)


	#相手に接続された時
	peer.on("connection",(conn)->
		console.log conn
		
		
		conn.on("open",->
			conn.on("data",(data)->
				console.log "Recived data is : #{data}"
			)
			
			conn.send("Hello world")
			
		)
	)




