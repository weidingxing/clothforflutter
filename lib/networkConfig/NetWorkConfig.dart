import 'package:dio/dio.dart';

class NetConfig{
 static final Map<String,dynamic> data={
   "type":"top",
   "key":"ac3977b95733a1a0e1b12bdc6976ca34"
 };

 static final Options options=new Options(
   responseType:ResponseType.plain,
   sendTimeout: 10,
   receiveTimeout: 10,
 );
static final IP="http://192.168.1.103";
 static final url="toutiao/index?";
 static final index_url=IP+":5000/";

 static final UPLOAD_URL=IP+":8989/upload";

 static final InsertUrl=IP+":5000/insert";
 static final Verify=IP+":5000/verify";
 static final SELECT=IP+":5000/select";
}