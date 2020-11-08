import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/views/chidViewPlugin/pluginView.dart';

class SearchGoods extends StatefulWidget {
  @override
  _SearchGoods createState() => _SearchGoods();
}

class _SearchGoods extends State<SearchGoods> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SearchGoodsWidget().searchListGoods(context),
      ],
    );
  }
}



