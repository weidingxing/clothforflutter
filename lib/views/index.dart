import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/otherView/menue.dart';
import 'package:graduationproject/otherView/search.dart';
import 'package:graduationproject/provider/goodsInfo.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:jhtoast/jhtoast.dart';
import 'package:provider/provider.dart';

import 'chidViewPlugin/pluginView.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _Index();
  }

}
class _Index extends State<Index> {
  List imageList;
  List photo;
  double position=0;
  double currentp=0;
  EasyRefreshController _controller;
  @override
  void initState() {
    _controller = EasyRefreshController();
    imageList = config["swiper_image"]; //得到一个列表
    photo = config['image'];
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              Container(
                  width: 220,
//                alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 3),
                  margin: EdgeInsets.only(top: 3.0, bottom: 3.0, right: 60),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      ///圆角
                      border: Border.all(color: Colors.red, width: 1)
                    ///边框颜色、宽
                  ),
                  child: InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: SearchUI());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          child: Text(
                            "搜索", style: TextStyle(color: Colors.black26),),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(130))
      ),

      body:Consumer(
        builder: (BuildContext context,POnloadData pdata,Widget child){
          return  EasyRefresh.custom(
                controller: _controller,
              enableControlFinishLoad:true,
                footer: ClassicalFooter(textColor: Colors.greenAccent),
                onLoad: () async{
                  var hide =  JhToast.showLoadingText(context,
                      msg:"正在加载中..."
                  );
                  pdata.get_data(2).then((value) =>
                      _controller.finishLoad(noMore: pdata.page>=10)
                  ).then((value) =>
                      pdata.update_page(),
                  ).then((value) =>
                      setState(() {
                        hide();
                        MainPages();//只重绘此页面
                      }),
                  );
                },
                slivers: <Widget>[
                  _Silver_padding(),//轮播图
                  _weather(),
                  _Silver_body(),//
                  MainPages()//主页内容
                ]
            );
        },
      )

    );
  }

  Widget _weather()
  {
    return SliverToBoxAdapter(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    );
  }

  Widget _swipes(BuildContext context, int index) {
    return Container(
      child: new ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6),),
        child: new Image.asset(imageList[index], fit: BoxFit.fill,),
      ),
    );
  }

  Widget _Silver_padding() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
      sliver: new SliverGrid( //Grid
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //Grid按两列显示
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          childAspectRatio: 3.0, //宽高比 调整宽高
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return sw();
          },
          childCount: 1,
        ),
      ),
    );
  }

  Widget sw() {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 200,
      decoration: BoxDecoration
        (
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Swiper(
        itemBuilder: _swipes,
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.blue,
                activeColor: Colors.red)
        ),
        onTap: (index) {
          print(index);
        },
      ),
    );
  }

  Widget _Silver_body() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
      sliver: new SliverGrid( //Grid
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //Grid按两列显示
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          childAspectRatio: 1.9, //宽高比 调整宽高
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              color: Colors.pinkAccent,
              child: Menue(),);
          },
          childCount: 1,
        ),
      ),
    );
  }

}


