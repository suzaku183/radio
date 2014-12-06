#P2Pを利用したラジオ配信機能の実装を進める




##引数に取得したバッファーを再生する関数
#play_sound = (buffer) ->
#	source = context.createBufferSource()
#	source.buffer = buffer
#	source.connect(context.destination)
#	source.start(0)



context = new window.AudioContext()



socket = io.connect()


navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia


context = new (window.AudioContext || window.webkitAudioContext)()

osc_node = context.createOscillator()
osc_node.connect(context.destination)

#osc_node.start(0)


navigator.getUserMedia({audio: true},
	(stream) ->
		
		#audio_el = document.querySelector("#audio")
		#audio_el.src = window.URL.createObjectURL(stream)
		#audio_el.play()
		
		

		#stream_node = context.createMediaStreamSource(stream)
		
		
		recorder = new MediaRecorder(stream)
		recorder.start(1000)
		recorder.ondataavailable = ((event)->
			socket.emit("audio",event.data)
		)



	,(error) ->
		console.log error
)

