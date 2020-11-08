import 'dart:async';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
//import 'package:flutter_localizations/flutter_localizations.dart';

//void main() => runApp(MyApp());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // App名字
      title: 'EasyRefresh',
      // App主题
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      // 主页
      home: _Example(),
//      localizationsDelegates: [
//        GlobalCupertinoLocalizations.delegate,
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate
//      ],
    );
  }
}

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<_Example> {

  List<Goods> reList=new List();
  Map<String,dynamic> getJsonData;
  int page=1;
 void _getData(pages) async {
    final String childUrl="cloth_page/$pages";
    Response value=await HttpUtil.gets(NetConfig.index_url+childUrl,option: NetConfig.options);
    String reData=value.toString();
    Map mapJson=json.decode(reData);
    GoodsJson re= new GoodsJson.fromJson(mapJson);
    List<Goods> list=re.goods;
    setState(() {
      page++;
      reList.addAll(list);
    });
//    return reList;
  }

  EasyRefreshController _controller;

  // 条目总数
  int _count = 20;
  var _futureData;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
//    _getData(page);
  }


  void test() async{
    await Future.delayed(Duration(seconds: 2), () {
      print('onRefresh');
      setState(() {
        _count = 20;
      });
      _controller.resetLoadState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EasyRefresh"),
        ),
        body: EasyRefresh.custom(
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          controller: _controller,
          header: ClassicalHeader(),
          footer: ClassicalFooter(),
          onRefresh: () async {
            test();
          },
          onLoad:
              () async{
         await Future.delayed(Duration(seconds: 1),() async{
             print("正在请求第$page页的数据");
             final String childUrl="cloth_page/$page";
             Response value=await HttpUtil.gets(NetConfig.index_url+childUrl,option: NetConfig.options);
             String reData=value.toString();
             Map mapJson=json.decode(reData);
             GoodsJson re= new GoodsJson.fromJson(mapJson);
             List<Goods> list=re.goods;
             setState(() {
               page++;
               reList.addAll(list);
             });
           });
         _controller.finishLoad(noMore: page >= 10);//必须有这个选项 要不然只请求一次
          },
//          onLoad: () async {
//            await Future.delayed(Duration(seconds: 2), () {
//              print('onLoad');
//              setState(() {
//                _count += 10;
//              });
//              _controller.finishLoad(noMore: _count >= 100);
//            });
//          },
          slivers:<Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: Image.network("http:"+reList[index].imageNet),
                    ),
                    color:
                    index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                  );
                },
                childCount: reList.length,
              ),
            ),
          ],
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
              onPressed: () {
                _controller.callRefresh();
              },
              child: Text("Refresh", style: TextStyle(color: Colors.black))),
          FlatButton(
              onPressed: () {
                _controller.callLoad();
              },
              child: Text("Load more", style: TextStyle(color: Colors.black))),
        ]);
  }
}