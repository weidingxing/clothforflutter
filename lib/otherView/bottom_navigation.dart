import 'package:flutter/material.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:graduationproject/views/category.dart';
import 'package:graduationproject/views/collect.dart';
import 'package:graduationproject/views/discover.dart';
import 'package:graduationproject/views/index.dart';
import 'package:graduationproject/views/personage.dart';

class MBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MBottomNavigation();
  }
}
class _MBottomNavigation extends State<MBottomNavigation> {
  final listpage=[
    Index(),
    Category(),
    Collect(),
    Discover(),
    Person(),

  ];
  var currentindex=0;
  var currentpag;
   final List<BottomNavigationBarItem> tabui=[
    _bottom("主页",MyFont().mainui),
    _bottom("分类",MyFont().category),
    _bottom("收藏",MyFont().collect),
    _bottom("发现", MyFont().collect),
    _bottom("我的",MyFont().person),
  ];
  static BottomNavigationBarItem _bottom(String title,IconData myFont){
    return BottomNavigationBarItem(
        icon: Icon(myFont),
        title: Text(
          title,
          style: TextStyle(fontSize: 15,color: Colors.white),
        )
    );

}

@override
  void initState() {
  currentpag=listpage[currentindex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.pinkAccent,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentindex,//当前的页面
            items: tabui,//需要遍历的页面
            onTap: (index){
              setState(() {
                  currentindex=index;
                  currentpag=listpage[currentindex];
              });
            },

    ),
      body: currentpag
    );
  }
}
