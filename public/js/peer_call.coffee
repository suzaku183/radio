$ ->

	socket = io.connect()
	broad_cast = $("#broad_cast")
	
	#配信が開始されたタイミングでTrueになる
	started = false

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)
	
	
	socket.on("check_deliver_radio",(data)->
		socket.emit("answer_radio_propery",started)
	)
		
	broad_cast.on("click",->
		console.log	"Clicked broad cast"
		

		navigator.getUserMedia({
			audio: true
		},(stream)->
		
			
			#配信が始まったタイミングでユーザーにリッスンボタンを表示させる
			started = true
			socket.emit("start_radio",true)

			#Peerオブジェクトの生成
			peer = new Peer({key: 'ca99fd4a-8e43-11e4-b490-ff1e952f2799'})
	
			

			#ここから下は配信するときの基幹コード
			console.log "Waiting lisnener"
			peer.on("open",(id)->
				console.log "配信者のIDは#{id}です"
	
				socket.on("recive_listener",(key)->
					console.log key
					call = peer.call(key,stream)
				)
			)
		,(err)->
			console.log err
		)
	)

