// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var peer, socket;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    peer = new Peer({
      key: "6165842a-5c0d-11e3-b514-75d3313b9d05"
    });
    socket = io.connect();
    return peer.on("open", function(id) {
      console.log(id);
      socket.emit("call", id);
      return peer.on("call", function(call) {
        call.answer();
        return call.on("stream", function(remote_stream) {
          var audio;
          console.log("Called");
          audio = document.querySelector("#audio");
          audio.src = window.URL.createObjectURL(remote_stream);
          return audio.play();
        });
      });
    });
  });

}).call(this);
