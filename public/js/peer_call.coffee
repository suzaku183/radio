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
			peer = new Peer({key: '6165842a-5c0d-11e3-b514-75d3313b9d05'})
	
			console.log "Waiting lisnener"
			peer.on("open",(id)->
				console.log id
	
				socket.on("recive_listener",(key)->
					console.log key
					call = peer.call(key,stream)
				)
	
				
			)
	
	
		,(err)->
			console.log err
		)
	)
