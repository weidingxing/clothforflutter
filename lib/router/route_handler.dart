import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/views/chidViewPlugin/goodsDetailPage.dart';
import 'package:graduationproject/views/chidViewPlugin/searchResultPage.dart';
import 'package:graduationproject/views/index.dart';

// ignore: non_constant_identifier_names
var SearchHandler=new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>>params){
      String id=params["id"]?.first;

    return SearchGoods();
    }
);

// ignore: non_constant_identifier_names
var GoodsDetailsHandler=new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>>params){
        Goods goods=Goods();
        goods.desc=params['desc'][0];
        goods.prices=double.parse(params['prices'][0]);
        goods.uniqueKey=params['uniqueKey'][0];
        return GoodsDetails(goods);
      }
);

var MyInfo=new Handler(
handlerFunc: (BuildContext context,Map<String,List<String>>params){
  return Index();
}
);