//import 'dart:io';
//
//import 'package:dio/dio.dart';
//
//class ImageUpload{
//
//
//  _uploadImage(image) async {
//
//    String path = image.path;
//    print(path);
//    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
//    print("文件名=$name");
//    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
//    print("hium=$suffix");
//    FormData formData = FormData.fromMap({
//
//      "files": await  MultipartFile.fromFile(path, filename: name),
//
//    });
//    var option = Options(method: "POST",
//        contentType: "multipart/form-data",
//      receiveTimeout: 200000,
//      sendTimeout: 200000,
//    );
//    var response =
//    await Dio().post("http://192.168.1.102:8989/upload", data: formData,options: option);
//    print(response);
//    if (response.statusCode == 200) {
//      Map responseMap = response.data;
//      print("http://192.168.1.102:8989${responseMap["path"]}");
////      setState(() {
////        // _imgServerPath = "http://jd.itying.com${responseMap["path"]}";
////      });
//    }
//  }
//
//
//
//  void _uploadClient() async {
//
//    List<String> _imagesUrlList = [];
//    for (int i = 0; i < images.length; i++) {
//      ByteData byteData =
//      await images[i].getByteData(quality: 10); //quality这是一个压缩的比例
//      String prePath =
//      await FileUtil.getInstance().getSavePath("/updateImage/");
//      String name = DateTime.now().millisecondsSinceEpoch.toString() + ".png";
//      File _imageFile = await File(prePath + name)
//          .writeAsBytes(byteData.buffer.asUint8List());
//      if (_imageFile != null) {
//        _imagesUrlList.add(_imageFile.path);
//      }
//    }
//
//    final res = await UploadRepository.upMultiFileLoadClient(
//        imagesUrlList: _imagesUrlList);
//
//    if (res["code"] == 0) {
//      if (widget.callback != null) {
//        imagesUrlData = res["data"];
//        widget.callback(imagesUrlData);
//      }
//    } else {
//      T.show(msg: "上传服务器失败，请重新操作");
//    }
//  }
//
//}