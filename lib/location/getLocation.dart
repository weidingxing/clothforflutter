//import 'package:flutter/material.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'package:amap_location_fluttify/amap_location_fluttify.dart';
//import 'package:permission_handler/permission_handler.dart';
//class Location extends StatefulWidget {
//
//  @override
//  _LocationState createState() => _LocationState();
//}
//
//class _LocationState extends State<Location> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//
//  String _locationInfo;
//  String _errorINfo;
//  void getLocationInfo()async{
//    setState(() {
//      _locationInfo+="开始定位。。。\n";
//    });
//    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
//    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
//    ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
//// 单次定位
//
//    if(serviceStatus==ServiceStatus.enabled){
//      if (permission==PermissionStatus.granted) {
//        setState(() {
//          _locationInfo+="取得定位权限...\n";
//        });
//
//        final location = await AmapLocation.instance.fetchLocation();
//
//        location.latLng
//        then((val){
//          setState(() => _locationInfo +=  "纬度：${getLat_LngStr(val.latitude)}\n经度：${getLat_LngStr(val.longitude)}");
//        });
//
//      }else{
//        setState(() {
//          _errorINfo+="未取得定位权限...";
//        });
//
//      }
//
//    }else{
//      setState(() {
//        _errorINfo+="未开启定位...";
//      });
//
//    }
//
//
//
//  }
//  ///转换度分秒
//  String getLat_LngStr(double degree) {
//    String str = "";
//    int de = degree.floor(); //整数部分
//    int min = ((degree - de) * 60).floor(); //分
//    double sec = ((degree - de) * 60 - min) * 60; //秒
//    // str="$de°$min′${sec.toStringAsFixed(4)}″";//秒保留4位
//    str = "$de ° $min′ $sec″"; //秒保留4位
//    print(degree);
//    print(str);
//    return str;
//  }
//
//
//
//
//}
