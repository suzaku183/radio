
$ ->
	
	#Peerオブジェクトの生成
	peer = new Peer({key: "6165842a-5c0d-11e3-b514-75d3313b9d05"})

	
	#ブラウザにIDを表示する
	peer.on("open",(id)->
		$("#peer_id").text(id)
		
		$("#send").on("click",->
			id = $("#form_id").val()
			
			
			#これで接続が開始される
			
			conn = peer.connect(id)
			console.log conn
				
			
			conn.on("open",->
				conn.on("data",(data)->
					console.log "Recived too : #{data}"
				)
			
				conn.send("Hello")

			)

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




