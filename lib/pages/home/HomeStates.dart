
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../app_icons.dart';
import 'TabbarAndListview.dart';

 class HomeStates extends StatelessWidget{
   List strings=["投票上币","应用中心","合作挖矿","合伙人"];
   List imgs=["static/images/home/home-icon3.png",
   "static/images/home/home-icon1.png",
   "static/images/home/home-icon4.png",
   "static/images/home/home-icon2.png"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Container(
          height: ScreenUtil.setHeight(350.0),
          child: Stack(
            overflow:Overflow.visible,
            children: <Widget>[
              Background_Image(),
              Message_box(),
            ],
          ),
        ),
      Container(
       height:ScreenUtil.setHeight(138.0),
       child: ListView.builder(
       itemCount: 5,
       scrollDirection: Axis.horizontal,
       itemBuilder: (BuildContext context, int index) {
       return Container(
         width: ScreenUtil.setWidth(210.0),
         padding: EdgeInsets.all(5),
         margin: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
           color: Color.fromRGBO(255, 255, 255, 1.0),
           borderRadius: BorderRadius.all(
             Radius.elliptical(8.0, 8.0),
           ),
           boxShadow: [
             BoxShadow(
               color: Color.fromRGBO(222, 231, 252, 0.6),
               blurRadius: 2.0,
             ),
           ],
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,

           children: <Widget>[
             Text(
               'EOS/USDT',
               style: TextStyle(
                 fontSize: 14.0,
                 color: Colors.black45,
               ),
             ),
             Text(
               '￥20252.52',
               style: TextStyle(
                 fontSize: 16.0,
                 color: Colors.red,
               ).copyWith( fontWeight: FontWeight.w500,
                 height: 1.4,),
             ),
             Text(
               '-1.35%',
               style: TextStyle(
                 fontSize: 14.0,
                 color: Colors.red,
               ),
             ),
           ],
         ),
       );
      }
      ),
      ),
      Container(
        width: double.infinity,
        height: ScreenUtil.setHeight(158.0),
        margin: EdgeInsets.all(
          ScreenUtil.setWidth(20.0),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          borderRadius: BorderRadius.all(
            Radius.elliptical(8.0, 8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(222, 231, 252, 0.6),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行三列
            childAspectRatio: 4.0 //显示区域宽高相等
        ), itemBuilder: (context, index) {
              return Container(
              padding: EdgeInsets.all(5),
              child: Row(
                  textDirection:TextDirection.ltr,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Center(
                          child: Text(strings[index],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ).copyWith( fontWeight: FontWeight.w500,
                                height: 1.4,)),
                        ),
                  ),
                  Image.asset(imgs[index],
                    height: ScreenUtil.setHeight(66.0),
                    fit: BoxFit.fitHeight,)
                  ],
              ),
              );
        }),
      ),
      Container(
      padding: EdgeInsets.symmetric(
       horizontal: ScreenUtil.setWidth(20.0),
      ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.elliptical(8.0, 8.0),
          ),
          child: Container(
              width: double.infinity,
              height:ScreenUtil.setHeight(138.0),
              child:Swiper(
                itemCount: 2,
                itemBuilder: (context,index){
                  return Image.network("https://abc.3pqm.top/03b2c65c516fcbb5b46ee90ee6546716df85d8691563530312",
                    fit: BoxFit.cover,);
                },
              ),
          ),
        ),
      ),
      TarBarAndListview()
      ],
    ));
  }
   Widget Background_Image(){
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.elliptical(15.0, 5.0),
        bottomRight: Radius.elliptical(15.0, 5.0),
      ),
      child: Container(
          width: double.infinity,
          height: ScreenUtil.setHeight(300.0),
          child:Image.network("https://abc.3pqm.top/bb4259cd5631390c3efbeb47e78ec6ea5b291a901562577003",fit: BoxFit.fill,)
      ),
    );
  }

   Widget Message_box(){
    return Positioned(
        bottom: ScreenUtil.setHeight(20.0),
        width:ScreenUtil.setWidth(750.0),
        child:Center(
          child:Container(
            padding:EdgeInsets.symmetric(horizontal:ScreenUtil.setWidth(20.0)),
            width: ScreenUtil.setWidth(680.0),
            height: ScreenUtil.setHeight(70.0),
            child:DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.white,Colors.white]), //背景渐变
                    borderRadius: BorderRadius.circular(20.0), //3像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black54,
                          offset: Offset(2.0,2.0),
                          blurRadius: 8.0
                      )
                    ]
                ),
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        AppIcons.BROADCAST,
                        size: 18.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                )
            ),
          ),
        )

    );
  }

}
