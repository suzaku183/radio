// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var peer;
    peer = new Peer({
      key: "6165842a-5c0d-11e3-b514-75d3313b9d05"
    });
    peer.on("open", function(id) {
      $("#peer_id").text(id);
      return $("#send").on("click", function() {
        var conn;
        id = $("#form_id").val();
        conn = peer.connect(id);
        console.log(conn);
        return conn.on("open", function() {
          conn.on("data", function(data) {
            return console.log("Recived too : " + data);
          });
          return conn.send("Hello");
        });
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
