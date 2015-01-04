// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var socket;
    socket = io.connect();
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    return navigator.getUserMedia({
      audio: true
    }, function(stream) {
      var peer;
      peer = new Peer({
        key: "6165842a-5c0d-11e3-b514-75d3313b9d05"
      });
      console.log("Waiting lisnener");
      return peer.on("open", function(id) {
        console.log(id);
        return socket.on("recive_listener", function(key) {
          var call;
          console.log(key);
          return call = peer.call(key, stream);
        });
      });
    }, function(err) {
      return console.log(err);
    });
  });

}).call(this);