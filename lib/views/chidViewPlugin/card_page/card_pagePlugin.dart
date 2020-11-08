import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterautotext/index.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/provider/goodsInfo.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:graduationproject/views/cloth/cloth_moder.dart';
import 'package:provider/provider.dart';

class CardPagePlugin extends StatefulWidget {
  @override
  _CardPagePluginState createState() => _CardPagePluginState();
}

class _CardPagePluginState extends State<CardPagePlugin> {

  List<bool> sele=[true,false,true,false];


//  ClothModer item;
//  CardPagePlugin(this.item);
  List img=config['image'];

  int counts=0;
//  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: false);
    return
        Consumer(
            builder:  (BuildContext context,POnloadData pdata,Widget child){
              return Stack(
                  children: <Widget>[
                      ListView.builder(
                         itemBuilder: (context,index)
                      {
                         return GoodsList(index,pdata.goodsList[index]);
                      },
                         itemCount: sele.length,
                      ),
                    _bottomPlugin()
                  ]);

            }
        );
  }
  Widget _bottomPlugin(){
    return Container(
//      height: 20,
      child: Positioned(
          top: ScreenUtil().setHeight(1310),
          height:70,
        width: ScreenUtil().setWidth(1080),
        child: Container(
          height: ScreenUtil().setHeight(200),
//          width: 50,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              bottomCheck(),
              Container(
                width: ScreenUtil().setWidth(360),
                height: 100,
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(150)),
//                color: Colors.yellow,
                child: Row(children: <Widget>[
                        Text("合计:"),
                        Text("￥78"
                            "00",style: TextStyle(color: Colors.red,fontSize: ScreenUtil().setSp(40)),),
                ],),
              ),
              _bottomTotal(),
            ],
          ),
        )
      ),
    );
  }
  Widget GoodsList(index,Goods data)
  {
    return  Container(
      height: 120,
      margin: EdgeInsets.only(left: 1,right: 1),
      alignment: Alignment.topLeft,
//      margin: EdgeInsets.all(4.0),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _checkbtn(index),
              SizedBox(width: 1,),
              _imageShow(data.imageNet),
              SizedBox(width: 1,),
              _goodsName(data.desc),

            ],
          ),
          Divider(color: Colors.red,)
        ],
      ),
    );
  }

  Widget _checkbtn(index)
  {
    return Container(
      alignment: Alignment.topLeft,
      width: 50,
      height: 80,
      margin: EdgeInsets.only(top: 20),
//      color: Colors.green,
      child: Checkbox(
        value: sele[index],
        activeColor: Colors.pink,
        onChanged: (bool val){
          setState(() {
              sele[index]=val;
          });

        },
      ),
    );
  }

  Widget _imageShow(imge)
  {
    return Container(
      width: 80,
        height: 100,
        alignment: Alignment.topLeft,

          child: new Image.network("http:"+imge,fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
          ),

    );
  }

  Widget _goodsName(desc)
  {
    return Container(
      width: 220,
      height: 100,
//      alignment: Alignment.topLeft,
      color: Color.fromARGB(1, 245, 245,245),
        child: Column(
         children: <Widget>[
           Text(desc,style: TextStyle(fontSize: 16) ,maxLines: 2,overflow: TextOverflow.ellipsis,),
           Row(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.only(top:30),
                     child: Text(
                       "￥ 18.9",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 14),
                     ),
                 ),
                 SizedBox(width: 1,),
                 goodsAdd()
               ],
           ),
         ],
        ),
    );
  }

  Widget goodsAdd(){

    return Container(
      height: 25,
      width: 103,
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(left: 68,top: 30),
      padding: EdgeInsets.only(left: 1),
      child: Row(
        children: <Widget>[
          count("一"),
          Container(
            width: 20,
            height: 20,
            child: Center(child: Text("$counts")),
          ),
          count("+"),
        ],
      ),

    );

  }

  Widget count(String icon)
  {
    return InkWell(
      onTap: (){
        setState(() {
          if(icon=="+")
            {
              counts++;
            }
         else
           {
             counts--;
           }
        });
      },
      child: Container(
        width: 40,
        height: 30,
        color: Colors.grey,
        child: Center(child: Text("$icon",style: TextStyle(fontSize: 15),)),
      ),
    );
  }


  Widget bottomCheck()
  {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Colors.pink,
            onChanged: (bool val){
            },
          ),
          Text("全选",style: TextStyle(fontSize: ScreenUtil().setSp(50)),)
        ],
      ),
    );
  }

  Widget _bottomTotal(){
    return InkWell(
      onTap: (){
        print("结算");
      },
      child:  Container(
        width: ScreenUtil().setWidth(300),
        height: ScreenUtil().setHeight(150),
        margin: EdgeInsets.only(bottom: 20,top: 2,left: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(child: Text("结 算",style: TextStyle(fontSize: ScreenUtil().setSp(60),color: Colors.white),)),
      )
    );


  }
}
