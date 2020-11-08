
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/auto_json/ToJson.dart';
import 'package:graduationproject/jsonToDart/JsonToDart.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';

import 'package:dio/dio.dart';

import 'chidViewPlugin/card_page/card_pagePlugin.dart';
class Collect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Collect();
  }
}

class _Collect extends State<Collect> {
   String title = "futureBuilder的应用";
   var _futureBuilder;
   List<Data> reList;
  Future<List> _getData () async {
     String reData;
     await new Future.delayed(new Duration(milliseconds: 2000));
     Response value=await HttpUtil.gets(BaseUrl.url+NetConfig.url,data: NetConfig.data,option: NetConfig.options);
     reData=value.toString();
     reList= new JsonToDart(reData).toJson();
     return reList;
    }
  @override
  void initState() {
    super.initState();
    _futureBuilder=_getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(title),

    ),
      body:Container(
        color: Color.fromRGBO(248, 248, 255, 1),
        child:
            CardPagePlugin(),
      )


    );
  }

}

