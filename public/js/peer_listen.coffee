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
	peer = new Peer({key: '6165842a-5c0d-11e3-b514-75d3313b9d05'})
	socket = io.connect()
	console.log util.supports.data

	peer.on("open",(id)->
		console.log	"お客様のIDは#{id}です"
		
		
		#アクセスしてきたブラウザがラジオに対応するかを確認する
		#対応の場合は対応時のHTMLをレンダリングさせてリッスンボタンでのイベント開始を待つ
		#
		#非対応の場合は対応ブラウザを案内するHTMLをレンダリングする
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
