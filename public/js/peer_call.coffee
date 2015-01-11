$ ->

	socket = io.connect()
	broad_cast = $("#broad_cast")

	#MediaStreamオブジェクトを作成
	navigator.getUserMedia = (
		navigator.getUserMedia ||
	  navigator.webkitGetUserMedia ||
	  navigator.mozGetUserMedia ||
	  navigator.msGetUserMedia
	)
	

	broad_cast.on("click",->
		console.log	"Clicked broad cast"

		navigator.getUserMedia({
			audio: true
		},(stream)->
			
			#Peerオブジェクトの生成
			peer = new Peer({key: 'ca99fd4a-8e43-11e4-b490-ff1e952f2799'})
	
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
