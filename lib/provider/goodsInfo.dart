import 'package:flutter/cupertino.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
class POnloadData extends ChangeNotifier{
  int page=1;
  List<Goods> goodsList=new List();
     Future get_data(time) async{
    await Future.delayed(Duration(seconds: time),() async{
      print("正在请求第$page页的数据");
      final String childUrl="cloth_page/$page";
      Response value=await HttpUtil.gets(NetConfig.index_url+childUrl,option: NetConfig.options);
      if(value==null)
        {

          return null;
        }
      String reData=value.toString();
      Map mapJson=json.decode(reData);
      GoodsJson re= new GoodsJson.fromJson(mapJson);
      List<Goods> list=re.goods;
      goodsList.addAll(list);
      NotificationListener();
//      return list;
      });

}

  update_page(){
    page++;
//    print(goodsList);
    NotificationListener();
  }


}