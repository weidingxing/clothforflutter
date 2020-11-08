import 'package:flutter/material.dart';
final image_path='images/';
const config={
  "detail_image":['images/detailImages/im1.jpg','images/detailImages/im2.jpg','images/detailImages/im3.jpg','images/detailImages/im4.jpg'
  ,'images/detailImages/im5.jpg','images/detailImages/im6.jpg','images/detailImages/im7.jpg','images/detailImages/im8.jpg'],
  "image":['images/lucency/taobao.jpg','images/lucency/dog_close.png','images/lucency/lu_cap.png',
    'images/lucency/lu_cap_woman.png','images/lucency/lu_pants.png','images/lucency/lu_skirt.png',
    'images/lucency/lu_woman.png','images/lucency/man_close.png','images/lucency/p_lu.png',
    'images/lucency/shop_lu.png'
         ],
  'search_goods':["images/sw1 (1).jpg","images/sw1 (2).jpg","images/sw1 (3).jpg","images/sw1 (4).jpg"],
  'swiper_image':['images/closesw.jpg','images/closesw2.jpg','images/closesw3.jpg','images/closesw4.jpg'],
  'menues':['今日爆款','夏季潮流','红包签到','一来一签','天天惊喜','天天有福','冬季潮流','秋季潮流','春季潮流','happy'],
  'leftTitle':['手机','生鲜','数码','百货','食品'],//'男鞋','女鞋','衣服','箱包','电器','内衣',],
//  'data':{'goods':[{''}]},
  '手机':['新品手机','华为系列','小米系列'],
  '新品手机':['images/lucency/taobao.jpg','images/lucency/dog_close.png','images/lucency/lu_cap.png',  'images/lucency/lu_cap_woman.png'],
  '华为系列':['images/lucency/lu_pants.png','images/lucency/lu_skirt.png',],
  '小米系列':['images/lucency/lu_woman.png','images/lucency/man_close.png','images/lucency/p_lu.png'],
  '生鲜':['蔬菜','白菜','青菜'],
  '数码':['相机','电视','电脑'],
  '百货':['鞋架','衣架','盆子'],
  '食品':['鱼肉','马肉','牛肉'],
  '男鞋':[''],
  '女鞋':[''],
  '衣服':[''],
  '箱包':[''],
  '电器':[''],
  '内衣':[''],
};


class MyFont{
  final IconData person=const IconData(
      0Xe610,fontFamily: "ConstomFont",matchTextDirection: true
  );
  final IconData collect=const IconData(
      0Xe60b,fontFamily: "ConstomFont",matchTextDirection: true
  );
  final IconData category=const IconData(
      0Xe60a,fontFamily: "ConstomFont",matchTextDirection: true
  );
  final IconData mainui=const IconData(
      0Xe689,fontFamily: "ConstomFont",matchTextDirection: true
  );
}


const searchlist=[
  "jiejie-姐姐",
  "gege-哥哥"
];

const recentSuggest=[
  "推荐1",
  "tuijian2"
];