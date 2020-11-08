
class GoodsJson{
  List<Goods> goods;
  GoodsJson({this.goods});
  GoodsJson.fromJson(Map<String, dynamic> json) {
    if (json['goods'] != null) {
      goods = new List<Goods>();
      json['goods'].forEach((v) {
        goods.add(new Goods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goods != null) {
      data['goods'] = this.goods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Goods {
  String desc;
  String imageNet;
  double prices;
  String uniqueKey;
  Goods({this.desc, this.imageNet, this.prices, this.uniqueKey});
  Goods.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    imageNet = json['imageNet'];
    prices = json['prices'];
    uniqueKey = json['uniqueKey'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['imageNet'] = this.imageNet;
    data['prices'] = this.prices;
    data['uniqueKey'] = this.uniqueKey;
    return data;
  }
}
