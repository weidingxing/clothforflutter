import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';


class Shopping extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Shopping();
  }
}

class _Shopping extends State<Shopping> {
  List shopping;
  @override
  void initState() {
    shopping=config["image"];
  }

  Widget Signal(index){
    return SingleChildScrollView(
      child: InkWell(
        onTap: (){
          print("object");
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                signalPhoto(index),
                multPhoto(index),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget signalPhoto(index){
    return Container(
      margin: EdgeInsets.all(6),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)) ,
        border: new Border.all(width: 1, color: Colors.red),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(shopping[index],height: 200,width: 150,),
          Text("￥200",style: TextStyle(fontSize: 15,color: Colors.black),),
        ],
      ),
    );
  }
  Widget multPhoto(index){
    var x,y;
    if(index==0)
      {
        x=0.0;
        y=-1.0;
      }
    else{
      x=-1.0;
      y=-1.0;
    }
    return Container(
        alignment:Alignment.center,
      margin: EdgeInsets.all(6),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)) ,
        border: new Border.all(width: 1, color: Colors.red),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(shopping[index],height: 220,width: 150,),
          Text("￥200",style: TextStyle(fontSize: 15,color: Colors.black),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
           children: List.generate(
               shopping.length,
               (index){
                return Signal(index);
               }
           ),
          ),
    );
  }

}
