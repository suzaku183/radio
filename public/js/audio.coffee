#P2Pを利用したラジオ配信機能の実装を進める

#navigator.getUserMedia = (
#	navigator.getUserMedia ||
#  navigator.webkitGetUserMedia ||
#  navigator.mozGetUserMedia ||
#  navigator.msGetUserMedia)
#
#socket = io.connect()
#
#navigator.getUserMedia({
#	audio: true
#},(stream)->
#	recorder = new MediaRecorder(stream)
#	
#	console.log stream
#
#	audio = document.querySelector("#audio")
#	audio.src = window.URL.createObjectURL(stream)
#	audio.play()
#
#	recorder.start(100)
#	
#	
#	recorder.ondataavailable = (event)->
#		console.log event.data
#		socket.emit("audio",event.data)
#		
#
#,(err)->
#	console.log err
#)
#
#
#
#
