import 'package:flutter/material.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/views/chidViewPlugin/pluginView.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
class GoodsDetails extends StatefulWidget {
  String cloth_key;
  GoodsDetails(this.goods);
  Goods goods;
  @override
  _GoodsDetailsState createState() => _GoodsDetailsState(goods);
}

class _GoodsDetailsState extends State<GoodsDetails> {
  Goods goods;
  String key;
  _GoodsDetailsState(this.goods);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List> _getData(key) async{
    final String childUrl="detailsLink/$key";
    Response value=await HttpUtil.gets(NetConfig.index_url+childUrl,option: NetConfig.options);
    String re=value.toString();
//    String reData=value.toString();
    Map mapJson=json.decode(re);
    List img=mapJson['img'][0];
    return img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon( Icons.search),

      ),
      body:FutureBuilder(
        future: _getData(goods.uniqueKey),
        builder: _buildFuture,
      ) ,
    );
  }
  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _stack(context, snapshot);
      default:
        return null;
    }
  }

  Widget _stack(BuildContext context, AsyncSnapshot snapshot)
  {
//      print(snapshot.data);
      List img=snapshot.data;
      GoodsDetailsWidget good=GoodsDetailsWidget(goods,swimages: img);
    return Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              good.goodsHeard(),
              good.Price(goods.prices),
              good.goodsInfo(context,img),
            ],
          ),
          good.bottomWidget(context),
        ],
      );
  }

}

