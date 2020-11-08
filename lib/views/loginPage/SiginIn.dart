import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:graduationproject/networkManager/myDio.dart';
import 'package:graduationproject/provider/userinfo.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../index.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  FocusNode _refocusNodePassWord = new FocusNode();

  String _username;
  String _password;
  String _repassword;
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

int flag=2;
  Future<int> verifyuser() async
  {
    var _form = _formKey.currentState;
    _form.save();
    //验证用户是否正确
    FormData formData = FormData.fromMap({"username": _username});
    String re=await HttpUtil.post(NetConfig.Verify,formData: formData);
    if(re=="fails"){

      Fluttertoast.showToast(
        msg: "用户名已存在",
        textColor: Colors.blue,
        backgroundColor:Colors.white,
      );
      flag=1;
      return 0;

    }
    else
      {
        flag=2;
        return 1;
      }

  }
  String validpwd(val)
  {
    var _form = _formKey.currentState;
    _form.save();
    print("sava");
    if(_password.isEmpty||_repassword.isEmpty)
      {
        return "密码不能为空";
      }
    else if(val.trim().length<6 || val.trim().length>18){
      return '密码长度不正确';
    }
    else if(_password!=_repassword)
      {

        return "两次密码不匹配";

      }
    else return null;
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750,height: 1334 , allowFontScaling: false);
  Widget  TextInput=new Container(
    margin: EdgeInsets.only(left: 20,right: 20),
    decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
    ),
    child: new Form(
      key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(180),),
            new TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入手机号",
                prefixIcon: Icon(Icons.person),

              ),
              onSaved: (val){
                _username=val;

              },
            ),
            new TextFormField(
//              controller: _userNameController,
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),

              validator: validpwd,
              onSaved: (pwd){
                _password=pwd;
              },
            ),
            new TextFormField(
//              controller: _userNameController,
              focusNode: _refocusNodePassWord,
              decoration: InputDecoration(
                labelText: "确认密码",
                hintText: "请确认密码",
                prefixIcon: Icon(Icons.lock),
              ),
              validator: validpwd,
              onSaved: (pwd)
              {
                _repassword=pwd;
              },
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      _focusNodePassWord.unfocus();
                      _focusNodeUserName.unfocus();
                      _refocusNodePassWord.unfocus();
                      verifyuser().then((value){
                        if(value == 0)
                          {
                            print("失败");
                          }
                        else if(value==1)
                          {
                          if (_formKey.currentState.validate()) {
                        //只有输入通过验证，才会执行这里
                        print("密码正确");
                        FormData fordata=FormData.fromMap({
                          "username":_username,
                          "password":_password
                        });
                        List<String> user=new List();
                        HttpUtil.post(NetConfig.InsertUrl,formData: fordata).then(
                                (value) {
                                  user.add(_username);
                                  user.add(_password);
                                  Provider.of<PUserInfo>(context, listen: false).saveUser(user);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      new MaterialPageRoute(builder: (context) => new MyApp()
                                      ), (route) => route == null);
                                  print("保存成功");

                                }
                        );
//                        _formKey.currentState.save();
                        //todo 登录操作

                      }
                          }
                      } );

                    },
                  child: Container(
                    width: ScreenUtil().setWidth(350),
                    height: ScreenUtil().setHeight(80),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(new Radius.circular(10))

                    ),
                    child: Center(child: Text("注  册",style: TextStyle(color: Colors.white,
                        fontSize: ScreenUtil().setSp(45)
                    
                    ),)),
                  ),
              )

              ,)
        ],
    )),
  );

    return Scaffold(
      appBar: AppBar(
        title: Text("注册页"),
      ),
      backgroundColor: Colors.white,
      body: new GestureDetector(
        onTap: (){
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          _refocusNodePassWord.unfocus();
          //获取状态后保存
        },
        child: ListView(

          children: <Widget>[
            TextInput,
          ],

        ),
      ),

    );

  }


}

