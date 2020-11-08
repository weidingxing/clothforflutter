import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:graduationproject/views/cloth/cloth_moder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardData extends ChangeNotifier{
  String id;
  setUser(id,ClothModer use) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(id, use.toString());
    NotificationListener();
  }
 Future<ClothModer> getUser(id) async{
   SharedPreferences pref = await SharedPreferences.getInstance();
   String data=pref.getString(id);
   
   if(data != null){
     Map<String, dynamic> re = json.decode(data);
     ClothModer cloth=new ClothModer.fromJson(re);
     return cloth;
   }
   else{return null;}
 }
}