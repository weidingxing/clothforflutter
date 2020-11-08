import 'dart:convert';
import 'dart:typed_data';
import 'package:graduationproject/networkConfig/NetWorkConfig.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UploadImg extends StatefulWidget {
  @override
  _UploadImgState createState() => _UploadImgState();

}

class _UploadImgState extends State<UploadImg> {
  List<Asset> images = List<Asset>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动态发布"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Pick images"),
            onPressed: loadAssets,
          ),
          Expanded(
            child: buildGridView(),
          ),
          FlatButton.icon(onPressed: (){
            _uploadImageToServer();
          }, icon: Icon(Icons.book), label: Text("提交"))
        ],
      ),
    );
  }
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );

  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print("错误=========");
      print(e.toString());
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      
    });
  }

  // 上传图片数据到Springboot后台
  _uploadImageToServer() async {
    var request=new http.MultipartRequest("POST",Uri.parse(NetConfig.UPLOAD_URL));
    for (Asset asset in images) {
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      request.files.add(new http.MultipartFile.fromBytes(
        "multipartFiles", imageData,
        filename: asset.name,
      ));
    }

    request.fields["user"]='weidingxing';

    try{
      var re=await request.send();
      if(re.statusCode==200)
      {
        print("成功");
        //获取消息
        var result=await re.stream.transform(utf8.decoder).join();
        print(result);
      }

    }catch(e)
    {
      print("wdx");
    }
  }

}
