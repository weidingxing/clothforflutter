import 'package:flutter/cupertino.dart';
class Myprovider extends ChangeNotifier{
  int count=0;
  var titleName="手机";
  void setConut(int count)
  {
    this.count=count;
  }
  int getCount()
  {
    return count;
  }

  void addData(){
    count++;
    NotificationListener();
  }
  setTitleName(String name)
  {
    titleName=name;
  }

}

