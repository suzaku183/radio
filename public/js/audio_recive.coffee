socket = io.connect()

AudioContext = window.AudioContext || window.webkitAudioContext


socket.on("send_audio",(data)->
	view = new Uint8Array(data)
	blob = new Blob([view], { "type" : "audio/ogg"})
	console.log blob
	console.log data
	
	URL = window.URL || window.webkitURL
	audio = document.querySelector("#audio")
	audio.src = URL.createObjectURL(blob)
	audio.play()
)
