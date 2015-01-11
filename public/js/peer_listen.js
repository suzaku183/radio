// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var audio, mute, peer, play, socket, use;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    socket = io.connect();
    play = $("#play");
    mute = $("#mute");
    use = $("#use");
    audio = "#audio";
    play.hide();
    socket.on("started_radio", function(data) {
      return play.fadeIn("slow");
    });
    socket.emit("was_started_radio", true);
    socket.on("radio_propety", function(data) {
      console.log(data ? "現在配信中のラジオがあります" : "現在配信中のサービスはなし");
      if (data) {
        return play.fadeIn("slow");
      }
    });
    if (util.supports.data) {
      use.text("You can use.");
    } else {
      use.text("You can not use.");
    }
    peer = new Peer({
      key: 'ca99fd4a-8e43-11e4-b490-ff1e952f2799'
    });
    return peer.on("open", function(id) {
      play.on("click", function() {
        return socket.emit("call", id);
      });
      return peer.on("call", function(call) {
        call.answer();
        return call.on("stream", function(remote_stream) {
          $("#tuned").text("Tuned");
          audio = document.querySelector("#audio");
          audio.src = window.URL.createObjectURL(remote_stream);
          return audio.play();
        });
      });
    });
  });

}).call(this);
