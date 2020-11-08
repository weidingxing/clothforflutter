import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/provider/userinfo.dart';
import 'package:graduationproject/views/loginPage/Login.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatefulWidget {
  String userName;
  MemberPage({Key key,this.userName}):super(key:key);
  @override
  _MemberPageState createState() => _MemberPageState(userName);
}

class _MemberPageState extends State<MemberPage> {
  String userName;
  _MemberPageState(this.userName);
  reflash() async
  {
    print("刷新");
    Provider.of<PUserInfo>(context, listen: false).getUserName()
        .then((value){
          setState(() {
            userName=value;
          });
    } );
  }
  @override
  Widget build(BuildContext context) {
    print("刷新");

    ScreenUtil.init(context,width: 1080,height: 1920);
    return
    Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                if(userName!=null)
                  {
                    Provider.of<PUserInfo>(context, listen: false).remove();
                  }
                Fluttertoast.showToast(msg: "login in!",
                  textColor: Colors.blue,
                  backgroundColor:Colors.white,
                );
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new LoginPage();
                })).then((value){
                  reflash();
                });
              },
              child: Text(userName=="游客"?"登录":"登出",style: TextStyle(fontSize: 16),),
            ),
          )
        ],
      ),
      body:ListView(
        children: <Widget>[
          _topHeader(context),
          _orderTitle(),
          _orderType(),
          _actionList()
        ],
      ) ,
    );
  }
  Widget _topHeader(context){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20.0),
      color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
          print("点击了icon");
          Provider.of<PUserInfo>(context, listen: false).getUserName().then((value) => print(value));
            },
            child:  Container(
              margin: EdgeInsets.only(top:20.0),
              child: ClipOval( //圆形头像
                child: CachedNetworkImage(
                  imageUrl: "http://img12.360buyimg.com/n7/jfs/t1/111012/12/17156/158380/5f549c20E4f0e9f49/fbcb57da123e68d0.jpg",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:10.0),
            child: Text(userName ??"游客",style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(36))),
          )
        ],
      ),
    );
  }
  //我的订单顶部标题
  Widget _orderTitle(){
    return Container(
      margin: EdgeInsets.only(top:10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(Icons.list,color: Colors.red,),
        title:Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
  Widget _orderType(){
    return Container(
      margin: EdgeInsets.only(top:5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.only(top:20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  size: 30,
                  color: Colors.red,
                ),
                Text('待付款'),
              ],
            ),
          ),
          //-----------------
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  size: 30,
                  color: Colors.red,
                ),
                Text('待发货'),
              ],
            ),
          ),
          //-----------------
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  size: 30,
                  color: Colors.red,
                ),
                Text('待收货'),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 30,
                  color: Colors.red,
                ),
                Text('待评价'),
              ],
            ),
          ),
        ],
      ),
    );

  }
  Widget _myListTile(String title){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

//也可以把图标同样作为参数
  Widget _myListTiles(myicon,String title){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 1,color: Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(myicon),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          _myListTile('客服电话'),
          _myListTile('关于我们'),
        ],
      ),
    );
  }
}