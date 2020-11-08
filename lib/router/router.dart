import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/router/route_handler.dart';

import 'application.dart';

class Routes{
  static String root = "/";
  static String searchgoodsui="/searchResultPage";
  static String goodsDetails="/goodsDetailPage";
  static String maingoods="/goodsDetailPage";
  static String indexpage="/index";
  static void  configureRoutes(Router router){
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print("route is not find !");
          return null;
        });
    router.define(searchgoodsui, handler: SearchHandler);
    router.define(goodsDetails, handler: GoodsDetailsHandler);
    router.define(maingoods, handler: GoodsDetailsHandler);
    router.define(indexpage, handler: MyInfo);
    // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
}
//下面是携带参数的跳转
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    Map par=new Map<String, dynamic>.from(params);
    if (params != null) {
      int index = 0;
      for (var key in par.keys) {
        var value = params[key];
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
//    print('我是navigateTo传递的参数：$params');
    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition);
  }

}
