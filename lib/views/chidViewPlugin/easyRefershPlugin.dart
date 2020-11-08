import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// ignore: must_be_immutable
class RefreshPlugin extends StatefulWidget {

  @override
  _RefreshPluginState createState() => _RefreshPluginState();
}

class _RefreshPluginState extends State<RefreshPlugin> {

  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

  }
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
      onRefresh:() async{

      },
      onLoad: () async{

      },
      slivers: [

      ],
    );
  }
}


