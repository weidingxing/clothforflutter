import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              itemBuilder: (context,index){
                return null;
              }

          );
        }
        else
          {
           print("正在加载...");
          }

      }
      ,
    );
  }
}

