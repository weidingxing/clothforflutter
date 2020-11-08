import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:graduationproject/image_picker/UploadImages.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:graduationproject/views/chidViewPlugin/discoverPage/photoView.dart';
import 'package:jhtoast/jhtoast.dart';

class MomentPlugin extends StatefulWidget {
  @override
  _MomentPluginState createState() => _MomentPluginState();
}
class _MomentPluginState extends State<MomentPlugin> {
    List photo = config['detail_image'];
    List imgList=[
      "http://img12.360buyimg.com/n7/jfs/t1/111012/12/17156/158380/5f549c20E4f0e9f49/fbcb57da123e68d0.jpg",
      "http://img10.360buyimg.com/n7/jfs/t1/127401/8/12102/163441/5f56e0faE4ecff550/126ca430c552af2b.jpg",
      "http://img10.360buyimg.com/n7/jfs/t1/143104/32/7915/222164/5f590086Ee0cb97a7/c87cd95c06a96e24.jpg",
      "http://img12.360buyimg.com/n7/jfs/t1/142696/14/7812/241301/5f560161Ed2f63e47/8b91cc2fa5787da3.jpg",
      "http://img10.360buyimg.com/n7/jfs/t1/110846/40/18912/183252/5f4e4a30E766da0c0/95739fa47746fe97.jpg",
      "http://img12.360buyimg.com/n7/jfs/t1/137238/9/9550/303572/5f5902eaE24e82131/cf95693952a0144f.jpg",
      "http://img13.360buyimg.com/n7/jfs/t1/149925/14/6448/240379/5f437ebdE638aa178/b4d9d74582a507b7.jpg",
    ];


  final double radius=10;

  getData() async{

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: false);
    return  Scaffold(
      appBar: AppBar(
        title: Text("发布动态"),
        actions: <Widget>[

          IconButton(icon:Icon(Icons.add), tooltip: '发布动态', onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return new UploadImg();
            }));
          },),

        ],

      ),

        body: EasyRefresh.custom(
//            controller: _controller,
            enableControlFinishLoad:true,
            footer: ClassicalFooter(textColor: Colors.greenAccent),
//            onLoad: () async{
//                  var hide = JhToast.showLoadingText(context,
//                   msg:"正在加载中..."
//                );
//              },
//          onRefresh: () async{
//              print("正在刷新");
//          },
         slivers: <Widget>[
           _membody(),

           _membody(),
           _membody(),
           _membody(),
         ],
    ),

    );
  }

  Widget _membody()
  {
    return SliverToBoxAdapter(
        child:
      Container(

        margin: EdgeInsets.only(bottom: 2,left: 1,right: 1,top: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft:
                          Radius.circular(radius),
                          bottomRight:
                          Radius.circular(radius)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
              InkWell(
                onTap: (){
                  print("点击头像");
                },
                child:  ClipOval( //圆形头像
                  child: Image.network(
                    'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                    width: 30.0,
                  ),
                ),
              ),
                              SizedBox(width: 10,),
                Text("这件衣服真好看"),
              ],
            ),

//            _imageShow(),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: (){

                  },
                  child:Icon(Icons.subject),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
Widget _asyImage(context)
{
  return FutureBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot)
    {
      switch (snapshot.connectionState) {
        case ConnectionState.none: return new Text('Press button to start');    //如果_calculation未执行则提示：请点击开始
        case ConnectionState.waiting: return new Text('Awaiting result...');  //如果_calculation正在执行则提示：加载中
        default:    //如果_calculation执行完毕
          if (snapshot.hasError)    //若_calculation执行出现异常
            return new Text('Error: ${snapshot.error}');
          else    //若_calculation执行正常完成
            return _imageShow(snapshot);
      }
    },
    future:getData() ,


  );
}


  Widget _imageShow(AsyncSnapshot snapshot)
  {
    List img=snapshot.data['result'];
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics:ClampingScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 4,
      mainAxisSpacing: 10,
      itemCount: img.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){

            Navigator.push(context,MaterialPageRoute(builder: (_){
              return new PhotpGalleryPage(photoList: imgList,index: index);
            }));
          },

          child: Image.network(imgList[index]),

        );
      },

      staggeredTileBuilder: (index) =>
          StaggeredTile.fit(1),
    );
  }

}




