import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:dio/dio.dart';
class Fresher extends StatefulWidget {
  @override
  _FresherState createState() => _FresherState();
}

class _FresherState extends State<Fresher> {
  int page=1;
  var _futureData;
  var datas;
  bool isLoading = false; //是否正在加载数据
  ScrollController _scrollController = ScrollController(); //listview的控制器
  List<Goods> reList=new List();
  Map<String,dynamic> getJsonData;
  Future _fredata() async{
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        page++;
      });
  });
  }
  Future _getData(pages)async{
    final String childUrl="cloth_page/$pages";
    Response value=await HttpUtil.gets(NetConfig.index_url+childUrl,option: NetConfig.options);
    String reData=value.toString();
    Map mapJson=json.decode(reData);
    GoodsJson re= new GoodsJson.fromJson(mapJson);
    List<Goods> list=re.goods;
    setState(() {
      reList.addAll(list);
    });
    return reList;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureData=_getData(1);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
          page++;
          _futureData=_getData(page);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fredata,
      child: FutureBuilder(
        builder: _buliderFuture,
        future: _futureData,
      ),
    );

  }

  Widget _buliderFuture(BuildContext context,AsyncSnapshot snapshot)
  {
    switch(snapshot.connectionState)
    {
      case ConnectionState.none:
        print("not have start network request");
        return Text("don't begin request ");
      case ConnectionState.active:
        print("active internet");
        return Text("active");
      case ConnectionState.waiting:
        print("waiting");
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print("done");
        if(snapshot.hasError)
        {
          return Text("error${snapshot.error}");
        }

        return  _createListView(context,snapshot);

      default:
        return null;
    }
  }
  Widget _createListView(BuildContext context,AsyncSnapshot snapshot)
  {
    return ListView.builder
      (
      itemBuilder: (context,index)
      {
        return _itemBuilder(context,index,reList);
      },
      itemCount: reList.length * 2,
      controller: _scrollController,
    );
  }
  Widget _itemBuilder(BuildContext context,int index,movies)
  {

    if(index.isOdd)
    {
      return Divider();//分割线
    }
    index=index ~/ 2;
    return ListTile
      (
      title: new Image.network("https:"+reList[index].imageNet),
//     leading: Text(reList[0].url),
//     trailing: Text(reList[0].date),
    );
  }

}
