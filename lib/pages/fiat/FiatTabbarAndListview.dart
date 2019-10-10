
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_icons.dart';

class FiatTarBarAndListview extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTabBarStates();
  }

}

class MyTabBarStates extends State<FiatTarBarAndListview> with SingleTickerProviderStateMixin{
  TabController _controller;
  List tabs = ["BTC", "ETH", "EEE","BTC", "ETH", "EEE"];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length:tabs.length, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         MarketTabBar(
           controller: _controller,
           list: tabs,
         ),
         MarketPageView(
           controller: _controller,
         ),
       ],
      );
  }
}
class MarketTabBar extends StatelessWidget {
  final TabController controller;
  final List list;
  const MarketTabBar({
    Key key,
    @required this.controller, this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.setHeight(80.0),
      color: Colors.white,
      child: TabBar(
          controller: controller,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelColor: Color.fromRGBO(41, 143, 227, 1.0),
          unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1.0),
          labelStyle: TextStyle(fontSize: 16.0),
          indicatorWeight: 1.0,
          tabs:  <Widget>[
          for (var item in list)
          Tab(
           text: '$item',
            )
           ],
        ),
    );
  }
}
class MarketPageView extends StatelessWidget {
  final TabController controller;
  const MarketPageView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: <Widget>[
          for(var i=0; i<controller.length;i++)
          MarketListView(type: i),
        ],
      ),
    );
  }
}
class MarketListView extends StatelessWidget {
  final int  type;
  const MarketListView({
    Key key,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(ScreenUtil.setWidth(20.0)),
        padding: EdgeInsets.all(ScreenUtil.setWidth(20.0)),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          borderRadius: BorderRadius.all(
            Radius.elliptical(8.0, 8.0),
          ),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  child:Container(
                  height: ScreenUtil.setHeight(66.0),
                  child: Center(
                    child: Text("市场"),
                  ),
                  )
              ),
              Expanded(
                  child:Container(
                    height: ScreenUtil.setHeight(66.0),
                    child: Center(
                      child: Text("最新价"),
                    ),
                  )
              ),
              Expanded(
                  child:Container(
                    height: ScreenUtil.setHeight(66.0),
                    child: Center(
                      child: Text("24h涨跌"),
                    ),
                  )
              ),
            ],
          ),
          Container(
            height: ScreenUtil.setHeight(287.0),
            child: ListView.builder(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: ScreenUtil.setHeight(87.0),
                itemBuilder: (context,index){
                  return Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                          child:Container(
                            height: ScreenUtil.setHeight(66.0),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  text: 'BTC/',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'USDT',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          child:Container(
                            height: ScreenUtil.setHeight(66.0),
                            child: Center(
                              child: Text("10.0",style:TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              )),
                            ),
                          )
                      ),
                      Expanded(
                          child:Container(
                            height: ScreenUtil.setHeight(66.0),
                            child: Center(
                              child: Container(
                                width: ScreenUtil.setWidth(156.0),
                                height: ScreenUtil.setHeight(56.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text("+10.0",style:TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          )
                      ),
                    ],
                  );
                }),
          )

        ],
      )
    );
  }
}