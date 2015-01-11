$ ->

	$(".button-collapse").sideNav()
	$('.parallax').parallax()

	#PeerJSのオブジェクトを作成してブラウザの対応状況を確認する
	peer = new Peer({key: '6165842a-5c0d-11e3-b514-75d3313b9d05'})
	peer.on("open",(id)->
		if util.supports.browser && util.supports.data
			console.log "You can use"
		else
			console.log "You can not use"
	)
