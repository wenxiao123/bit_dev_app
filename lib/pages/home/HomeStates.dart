
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_icons.dart';

class HomeStates extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }

}

class HomePage extends State<HomeStates>{
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil.setHeight(350.0),
          child: Stack(
           // fit: StackFit.expand,
            overflow:Overflow.visible,
            children: <Widget>[
              ClipRRect(
              borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(15.0, 5.0),
              bottomRight: Radius.elliptical(15.0, 5.0),
              ),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil.setHeight(300.0),
                  child:Image.network("https://abc.3pqm.top/bb4259cd5631390c3efbeb47e78ec6ea5b291a901562577003",fit: BoxFit.fill,)
                ),
              ),
              Positioned(
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
                        padding: EdgeInsets.symmetric(horizontal: 5),
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

              ),
            ],
          ),
        )
      ],
    );
  }
}