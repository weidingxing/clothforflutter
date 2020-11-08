import 'package:dio/dio.dart';
class BaseUrl{
  // 配置默认请求地址
  static const String url = 'http://v.juhe.cn/';
}

class HttpUtil{
  static Future<Response> gets(
      String url,
      {
        Map<String,dynamic> data,
        Options option,
      }

)async
  {
    Dio dio=new Dio();
    Response re;
    print(url);
    try{
      re=await dio.get(url,queryParameters: data,options: option);
      return re;

    }on DioError catch(e)
    {
      print("发生错误$e.toString()");
      return null;
    }
  }

  static Future post(
      String url,{
        FormData formData,

      })async {
    Dio dio=new Dio();
    Response response;
    try{
      response=await dio.post(url,data: formData);
      return response.data;
    }on DioError catch(e)
    {
      print("插入错误");
      return null;
    }

  }

}