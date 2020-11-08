
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:graduationproject/auto_json/ServiceJson.dart';
import 'package:graduationproject/provider/card_data.dart';
import 'package:graduationproject/provider/goodsInfo.dart';
import 'package:graduationproject/router/application.dart';
import 'package:graduationproject/router/router.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:graduationproject/views/cloth/cloth_moder.dart';
import 'package:provider/provider.dart';
class SearchGoodsWidget
{
  List images=config['search_goods'];
  Router router=Router();

  Widget searchListGoods(BuildContext context)
  {
    return SliverList(
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(/* 每一个商品由container包裹*/
//              color: Colors.pinkAccent,
              child: _listGoods(context,index),
            );
          },
          childCount: images.length
        ),
    );
  }

  Widget _listGoods(BuildContext context,int i)
  {
    Routes.configureRoutes(router);
    Application.router=router;
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, Routes.goodsDetails);
      },
      child: Container(
        color:Color.fromARGB(2, 211, 211, 211),
        margin: EdgeInsets.only(bottom: 1),
        child: Row(
          children: <Widget>[
            _goodsImage(i),
            _goodsDescribe(),
            Divider(color:Colors.red),
          ],
        ),
      ),
    );
  }

   Widget _goodsImage(int i)
  {
    return Container(

        width:150 ,
        height: 150,
        margin: EdgeInsets.only(top: 10,left: 2,right: 3),
        decoration: BoxDecoration(
//          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),

//      margin: EdgeInsets.only(left: 1,right: 1),
    child: new ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: new Image.asset(images[i]),
    ),
//        child: Image.asset(images[i],height: 100,width:100,),

    );

  }
  Widget _goodsDescribe()
  {
    return Container(
      margin: EdgeInsets.only(left: 1),
      color: Colors.yellow,
      height: 150,
      width: 200,
        child: Column(
          children: <Widget>[
            RichText(
              maxLines:2,

              overflow: TextOverflow.ellipsis,
//          textScaleFactor: 1,
              softWrap:true,
              text: TextSpan(
                text: "i'm textspan "*4,
                style: TextStyle(color: Colors.blue,fontSize: 15),
              ),
            ),
          Text("helloaaaaa",textAlign:TextAlign.left,)
          ],
        )

    );
  }
  /****
   * class end
   * */
}

/**
 * goods search page
 **/
class GoodsDetailsWidget
{

  List swimages;
  GoodsDetailsWidget(this.good,{this.swimages});
  Goods good;
  Widget goodsHeard()
  {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 4.0),
      sliver: new SliverGrid( //Grid
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, //Grid按两列显示
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 3.0,
      childAspectRatio: 1, //宽高比 调整宽高
    ),
      delegate: new SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _goodsSwiper(index);
      },
            childCount: 1,
     ),
    ),
   );
  }
  //放一个轮播图
  Widget _goodsSwiper(int i)
  {
    return Container(
//      margin: EdgeInsets.all(5.0),
      height: 300,
      decoration: BoxDecoration
        (
//        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      child: Swiper(
        itemBuilder: swiperBuilder,
        itemCount: swimages.length>6?6:swimages.length,
        scrollDirection: Axis.horizontal,
        autoplay: false,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.blue,
                activeColor: Colors.red)
        ),
        onTap: (index) {
          print(index);

        },
      ),
    );
  }
  Widget swiperBuilder(BuildContext context,int index)/**轮播图的图片*/
  {
    return Container(
      child: new ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6),),
        child: new Image.network(swimages[index], fit: BoxFit.fill,),
      ),
    );
  }

  Widget bottomWidget(BuildContext context)
  {
    return Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              _addToCard(context),
              _buyNow(),
            ],
        )
    );
  }

Widget _addToCard(context)
{

  return  Positioned(
    left: 0,
    child: Consumer(
      builder: (BuildContext context,CardData card,Widget child){
        return InkWell(
         onTap: (){
          String id="123";
          ClothModer cloth=ClothModer();
          cloth.imagePath="www";
          cloth.count=1;
          cloth.descr="bbbbb";
          cloth.price=2.2;
          card.setUser(id, cloth);
          print("加入成功");
        },
          child: Image.asset("images/joincard.jpg",width: 180,height: 40,),

        );
    }
    ),
  );
}

Widget _buyNow()
{
  Map<dynamic,dynamic> map;
  return  Positioned(
    left: 122,
    child: Consumer(
      builder: (BuildContext context,CardData card,Widget child){
        return InkWell(
          onTap: (){
           card.getUser("123").then((value) =>{

             print(value.imagePath),

           });
          },
          child: Image.asset("images/mall.jpg",width: 180,height: 40,),
        );
      },
    )
  );
}

// ignore: missing_return, non_constant_identifier_names
Widget Price(double price)
{
  return SliverToBoxAdapter(
    child: Container(
      alignment: Alignment.centerLeft,
      height: 150,
      width: 260,
      padding: EdgeInsets.only(left: 0),
      child: Column(
        children: <Widget>[
          RichText(
          text: TextSpan(
            children:[
              TextSpan(
                text: "￥",style:TextStyle(color: Colors.red,fontSize: 16)
              ),
              TextSpan(
                text: "$price",style:TextStyle(color: Colors.red,fontSize: 20),
              ),
              TextSpan(
                text: "  价格￥",style:TextStyle(fontSize: 12,color:  Color.fromRGBO(220, 220, 220, 1)),
              ),
              TextSpan(text: "100",style: TextStyle(fontSize: 12,color: Color.fromRGBO(220, 220, 220, 1),decoration: TextDecoration.lineThrough,
                  decorationColor: const Color.fromRGBO(220, 220, 220, 1))),
            ]
          ),
          ),

          SizedBox(height: 5,),
          Expanded(
            child:  Text(
              "湘西外婆炒腊肉农家开胃榨菜咸菜下饭菜湖南梅菜豆角萝卜干香辣",
              maxLines: 2,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          Text("------商品详情--------",style: TextStyle(color: Colors.red),),
        ],
      ),
    ),
  );
}

Widget goodsInfo(BuildContext context,List goodsinfo)
{
  List img=goodsinfo;
  return SliverList(
    delegate: SliverChildBuilderDelegate(
        (BuildContext context,int index){
          return _goods_details(index,img);
        },
        childCount: goodsinfo.length
    ),

  );
}

Widget _goods_details(int i,img)
{
  return Image.network(img[i],);
}
  /**
   * class end*/
}

class MainPages extends StatefulWidget {
  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {

  @override
  void initState() {
    super.initState();
  }
  Router router=Router();
   @override
   Widget build(BuildContext context) {
    return  Consumer(
      builder: (BuildContext context,POnloadData pdata,Widget child){
        if(pdata.goodsList.length<1){
          pdata.get_data(0).then((value) =>  pdata.update_page());

        }
        return SliverToBoxAdapter(
          child:
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics:ClampingScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 10,
              itemCount: pdata.goodsList.length,
              itemBuilder: (context, index) {
                return itemWidget(index,pdata);
              },
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index == 0 ? 2.5 : 2.7)
          ),
        );
      },
    );
 }

  Widget itemWidget(int index,POnloadData pdata) {
    Routes.configureRoutes(router);
    Application.router=router;
    Goods goods;
    return  new Material(
          elevation: 8.0,
          borderRadius: new BorderRadius.all(
            new Radius.circular(8.0),
          ),
          child:InkWell(
            onTap: (){
              goods=new Goods();
              goods.uniqueKey=pdata.goodsList[index].uniqueKey;
              goods.desc=pdata.goodsList[index].desc;
              goods.prices=pdata.goodsList[index].prices;
              goods.imageNet=pdata.goodsList[index].imageNet;
              Routes.navigateTo(context, Routes.goodsDetails,params: {
                      "desc":Uri.encodeComponent(goods.desc),
                      "imageNet": Uri.encodeComponent(goods.imageNet),
                      "prices":goods.prices.toString(),
                      "uniqueKey":goods.uniqueKey
              });
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  _goodsImg(index,pdata),
                  _goodsDesc(index, pdata),
                ],
              ),
            )
            ,
          )
    );
  }
  Widget _goodsDesc(int index,POnloadData imgDesc){
    return Container(
      padding: EdgeInsets.only(top: 1,bottom: 1),
      margin: EdgeInsets.only(top: 2,left: 1,right: 1),
      child: Text(
        imgDesc.goodsList[index].desc,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

  }
  Widget _goodsImg(int index,POnloadData imgUrl){

    return Container(
    padding: EdgeInsets.only(top: 1,bottom: 1),
      margin: EdgeInsets.only(top: 2,left: 1,right: 1),
      child: Hero(
        tag: index,
        child: CachedNetworkImage(
          imageUrl:"http:"+imgUrl.goodsList[index].imageNet ,
          fit: BoxFit.fitWidth,
          /*    placeholder: (context, url) =>
                        Image.asset('assets/wallfy.png'),*/
        ),
      ),
    );

  }

}








