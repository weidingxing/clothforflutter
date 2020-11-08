import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PUserInfo extends ChangeNotifier{

  String _user_name;
  saveUser(List<String> user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("userinfo", user);
    notifyListeners();
  }

  _setUser() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String > data=prefs.getStringList("userinfo");
    if(data==null)
      {
        _user_name="游客";
      }
    else
      {
        _user_name=data[0];
      }

  }


  Future <String>getUserName() async{
   await _setUser();
    return _user_name;
  }

  remove() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userinfo");
    notifyListeners();
  }
}