import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';


class Menue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenueState();
  }
}

class _MenueState extends State<Menue> {
  List menue_image;
  List menue;
  @override
  void initState() {
    menue=config['menues'];//文字
    menue_image=config["image"];//图片
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 160,
      margin: EdgeInsets.only(left: 8, top: 18,right: 8,bottom: 18),
//设置 child 居中
////      alignment: Alignment(0,0),
      decoration: new BoxDecoration(
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.red),
      ),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          crossAxisSpacing: 2.0,//水平的间距
          mainAxisSpacing: 20.0, //垂直间距
          childAspectRatio: 1.0,//子Widget宽高比例
          padding: EdgeInsets.all(6.0),
          children: List.generate(
                    menue_image.length,
//              menue_image.length,
                  (index){
                      setState(() {
                        print( menue_image.length);
                      });
                return item(menue_image,index);
              }
          ),
        )
    );
  }

  Widget item(List data,int index){
    return InkWell(
      onTap: (){
        print(index);
      },
        child: Column(
          children: <Widget>[
            Expanded(
              child:  new Image.asset(menue_image[index],
                width: 100,
                height: 95,
              ),
            )
            ,
            SizedBox(height: 15,),
           Expanded(
            child: Text(menue[index],style: TextStyle(fontSize: 10),)

           )
          ],
        ),


    );
  }

}
