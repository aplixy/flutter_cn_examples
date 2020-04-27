import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  WebSocketRoute({Key key}) : super(key: key);

  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {

  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    super.initState();
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "WebSocketRoute",
      bodyWidget: Padding(
        padding: EdgeInsets.all(20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Send a message"),
              ), 
            ), 

            StreamBuilder(
              stream: channel.stream, 
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: ${snapshot.data}";
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0), 
                  child: Text(_text),
                );
              }, 
            ), 
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage, 
        tooltip: "Send message",
        child: Icon(Icons.send),
      )
    );
  }
}