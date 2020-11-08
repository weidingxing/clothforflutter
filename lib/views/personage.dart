
import 'package:flutter/material.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:graduationproject/otherView/member.dart';
import 'package:graduationproject/provider/userinfo.dart';
import 'package:provider/provider.dart';

class Person extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Person();
  }

}

class _Person extends State<Person> {
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    username=Provider.of<PUserInfo>(context, listen: false).getUserName();
//    print(username);
  }

  Future<String>  _getUser() async{
    var se=Provider.of<PUserInfo>(context, listen: false).getUserName();
    return se;
  }
  @override
  Widget build(BuildContext context) {

      return FutureBuilder(
        future: _getUser(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {      //snapshot就是_calculation在时间轴上执行过程的状态快照
        switch (snapshot.connectionState) {
          case ConnectionState.none: return new Text('Press button to start');    //如果_calculation未执行则提示：请点击开始
          case ConnectionState.waiting: return new Text('Awaiting result...');  //如果_calculation正在执行则提示：加载中
          default:    //如果_calculation执行完毕
            if (snapshot.hasError)  {
              return new Text('Error: ${snapshot.error}');
            }  //若_calculation执行出现异常

            else {
              username=snapshot.data;
              print(username);
              return new MemberPage(userName: username,);
            } //若_calculation执行正常完成

        }
      },
      );


  }
}