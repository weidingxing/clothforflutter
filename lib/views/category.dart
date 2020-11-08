import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider/dataShare.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:provider/provider.dart';
import 'categoryGoods/catagory_page.dart';
class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Category();
  }
}
class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品分类")),
      body: Container(
          child: LeftCategory(),
      )
    );
  }
}

class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory>{
  @override
  List leftTitle;
  var cindex=0;
  void initState() {
    print("object");
    leftTitle=config["leftTitle"];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(248, 248, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(//左侧列表导航栏
            alignment: Alignment.centerLeft,
            width: 80,
            child: ListView.builder(
                 itemCount: leftTitle.length,
                itemBuilder:(content,index){
                   return _listName(index);
                }
            ),
          ),

          CategoryShopping(),
       ],
      ),
    );
  }

  Widget _listName(index){
    bool flag=false;
    flag=(cindex==index)?false:true;
    return Consumer<Myprovider>(
      builder: (contexts,value,child){
        return  InkWell(
          onTap:(){

            setState(() {
              cindex=index;
                value.setTitleName(leftTitle[index]);

            });

          },
          child:  Container(
            height: 50,
//        color: Colors.black12,
            decoration: BoxDecoration(

                color: flag?Colors.white:Color.fromRGBO(248, 248, 255, 1),
                border: Border(
                    bottom: BorderSide(width: 1,color: Colors.white70)
                )
            ),
            alignment: Alignment.center,
            child: Text(leftTitle[index],style: TextStyle(fontSize: 16,color: flag?Colors.black:Colors.pinkAccent),),
          ),
        );

      },
    );

  }

}



