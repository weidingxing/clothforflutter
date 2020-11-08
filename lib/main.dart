import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider/card_data.dart';
import 'package:graduationproject/provider/goodsInfo.dart';
import 'package:graduationproject/provider/userinfo.dart';
import 'package:graduationproject/router/application.dart';
import 'package:graduationproject/router/router.dart';
import 'package:provider/provider.dart';
import 'otherView/bottom_navigation.dart';
import 'provider/dataShare.dart';
void main() {
  runApp(
      MultiProvider(
        providers:
        [
          ChangeNotifierProvider(create: (ctx)=>Myprovider(),),
          ChangeNotifierProvider(create: (ctx)=>CardData(),),
          ChangeNotifierProvider(create: (ctx)=>POnloadData(),),
          ChangeNotifierProvider(create: (ctx)=>PUserInfo(),),

        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}

class _MyApp extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
        home: Scaffold(
          body: MBottomNavigation(),

        ),
        onGenerateRoute: Application.router.generator
    );
  }
}
