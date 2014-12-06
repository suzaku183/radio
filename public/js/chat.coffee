$ ->
	socket = io.connect()
	chat = $("#chat")
	btn = $("#btn")
	ul = $("#msgs")


	#サーバーへのメッセージの送信
	btn.on("click",->
		message = chat.val()
			
		socket.json.emit("send_chat_data",{
			message: message,
			user: Math.round(Math.random()* 100000000),
			created_at: new Date()
		})
		chat.val("")

		message = null
	)


	socket.on("chat_data_from_server",(data)->
		ul.append($("<li>").text("#{data['message']} => #{data['created_at'] }"))
	)


