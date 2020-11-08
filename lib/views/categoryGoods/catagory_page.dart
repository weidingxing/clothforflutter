import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduationproject/provider/dataShare.dart';

import 'package:graduationproject/viewConfigruation/ViewConfig.dart';

import 'package:provider/provider.dart';
class CategoryShopping extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryShopping();
  }
}

class _CategoryShopping extends State<CategoryShopping> {
 static String goodsname="新品手机";
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context,width: 350,height: 800);
    return Container(
        width: ScreenUtil().setWidth(265),
        height: ScreenUtil().setHeight(800),
        color: Color.fromRGBO(248, 248, 255, 1),
        child: SingleChildScrollView(

          child:Consumer<Myprovider> (
            builder: (context,values,child){
              return Column(
                  children:List.generate(
                      config[values.titleName].length,
                          (index)
                  {
                    goodsname=values.titleName;
                    return _listpage(index);
             }));
            }
          ),
        )
    );
  }

  Widget _listpage(int index)
  {
    return  Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15,top: 5),
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.bottomLeft,
          child: Consumer<Myprovider>(
              builder: (context,value,child){
                return Text(config[value.titleName][index]);
                  },
             ),
        ),
        _goods(index),
      ],
    );
  }

  Widget _goods(index)
  {
    var newTitle=config[goodsname][index];
    print(config[newTitle].length);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 5),
        padding:EdgeInsets.only(left: 5,right: 2,top: 5) ,
        alignment: Alignment.topLeft,
        child:GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,//每行有三个
            shrinkWrap:true,
            crossAxisSpacing:1.0,
            mainAxisSpacing:2.0,
            children: List.generate(config[newTitle].length, (index){
              return _mg(index,newTitle);
            })
        )
    );
  }
  Widget _mg(int index,String imageTitle)
  {
    return new InkWell(
      onTap: (){
        print("恭喜你点中了我$index");

      },
      child: Column(
        children: <Widget>[
          Image.asset(config[imageTitle][index],width: 100,height: 60,),
          SizedBox(height: 5),
          Text("￥300",style: TextStyle(fontSize: ScreenUtil().setSp(12)),)
        ],
      ),
    );
  }
}
