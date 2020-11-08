import 'dart:convert';
class ClothModer{
  String imagePath;
  double price;
  String descr;
  int count;

  ClothModer({this.imagePath,this.price,this.count,this.descr});
  @override
  String toString() {
    return '{"imagePath":"$imagePath","price":$price,"descr":"$descr","count":$count}';
  }

  ClothModer.fromJson(Map<String, dynamic> json) {

    imagePath=json['imagePath'];
    price=json['price'];descr=json['descr'];count=json['count'];

  }


}