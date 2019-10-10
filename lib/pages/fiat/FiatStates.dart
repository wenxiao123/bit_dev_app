import 'package:bit_dev_app/pages/home/TabbarAndListview.dart';
import 'package:bit_dev_app/utils/app_ontap.dart';
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FiatTabbarAndListview.dart';
import 'TypeState.dart';

class FiatStates extends StatefulWidget{
  List strings=["购买","出售","订单"];
  List imgs=["static/images/home/home-icon3.png",
  "static/images/home/home-icon1.png",
  "static/images/home/home-icon4.png",
  "static/images/home/home-icon2.png"];
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FiatState();
  }
}

class FiatState extends State<FiatStates> with SingleTickerProviderStateMixin {
  var _list=["BTC","ETH","TTT","BTC","ETH",];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _list.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      builder: (BuildContext context) => TypeState(),
      child:Consumer<TypeState>(
          builder: (context, state, _) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: ScreenUtil.setHeight(48.0),),
                  Container(
                      height: ScreenUtil.setHeight(88.0),
                      color: Colors.blue,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BarButton(
                            title: '购买',
                            isSelected: state.type == 1,
                            onTap: () => state.setType(1),
                          ),
                          BarButton(
                            title: '出售',
                            isSelected: state.type == 2,
                            onTap: () => state.setType(2),
                          ),
                          BarButton(
                            title: '订单',
                            isSelected: false,
                            onTap: () {},
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child:FiatTarBarAndListview(),
            )
                ]
            );
          }
      ) ,
    );
    }
  }
class BarButton extends StatelessWidget{
  final String title;
  final Function onTap;
  final bool isSelected;
  const BarButton({Key key,
    this.title,
    this.onTap,
    this.isSelected}) : super(key: key);
  static const TextStyle W700_WHITE_18 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle W700_WHITE_14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppOnTap(
      onTap: onTap,
      child: Container(
        width: ScreenUtil.setWidth(140.0),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: isSelected ? W700_WHITE_18 : W700_WHITE_14,
        ),
      ),
    );

  }
}