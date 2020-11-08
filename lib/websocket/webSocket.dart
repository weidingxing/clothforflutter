import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSockets extends StatefulWidget{
//  final String title;
//  final WebSocketChannel channel;
//
//  WebSockets({Key key,@required this.title,@required this.channel}): super(key: key);

  @override
  _WebSockets createState()=> new _WebSockets();
}

class _WebSockets extends State<WebSockets> {

  final channel=IOWebSocketChannel.connect('ws://echo.websocket.org');
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
   IOWebSocketChannel.connect('ws://127.0.0.1');
  }
  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.none)
              {
                print("没有连接网络");
                return Text("没有网");
              }
            if(snapshot.connectionState==ConnectionState.waiting){
              print("等待中");
            }
            if(snapshot.connectionState==ConnectionState.done)
              {
                print("完成");
                print(snapshot.data);
              }
            if (snapshot.connectionState == ConnectionState.active) {
              print("连接到网络");
              print(snapshot.data); // {"event":"events","data":"hello i'm Nestjs"}
              return Container(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Text('${snapshot.data}'),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), //
    );
  }

  /// 向服务器发送数据
  void _sendMessage() {
    print('send event!');
    channel.sink.add(
      jsonEncode(
        {
          "event": 'events',
          'data': 'Hi i\'m Flutter',
        },
      ),
    );
  }
}