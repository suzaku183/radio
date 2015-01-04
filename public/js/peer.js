// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var peer;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    peer = new Peer({
      key: "6165842a-5c0d-11e3-b514-75d3313b9d05"
    });
    peer.on("open", function(id) {
      $("#peer_id").text(id);
      return $("#send").on("click", function() {
        id = $("#form_id").val();
        return navigator.getUserMedia({
          audio: true
        }, function(stream) {
          var audio, call;
          audio = document.querySelector("#audio");
          audio.src = window.URL.createObjectURL(stream);
          console.log("Start broad cast");
          return call = peer.call(id, stream);
        }, function(err) {
          return console.log(err);
        });
      });
    });
    peer.on("call", function(call) {
      call.answer();
      return call.on("stream", function(remote_stream) {
        var audio;
        console.log("Audio connected");
        audio = document.querySelector("#audio");
        audio.src = window.URL.createObjectURL(remote_stream);
        audio.play();
        $("#d_call").on("click", function() {
          var d_id;
          d_id = $("#d_form").val();
          console.log("Second clicked : " + d_id);
          return call = peer.call(d_id, remote_stream);
        });
        return console.log(remote_stream);
      });
    });
    return peer.on("connection", function(conn) {
      console.log(conn);
      return conn.on("open", function() {
        conn.on("data", function(data) {
          return console.log("Recived data is : " + data);
        });
        return conn.send("Hello world");
      });
    });
  });

}).call(this);