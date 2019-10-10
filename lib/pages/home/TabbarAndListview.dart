
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_icons.dart';

class TarBarAndListview extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTabBarStates();
  }

}

class MyTabBarStates extends State<TarBarAndListview> with SingleTickerProviderStateMixin{
  TabController _controller;
  List tabs = ["涨幅榜", "跌幅榜", "成交排行"];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length:3, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(
      horizontal: ScreenUtil.setWidth(20.0),
    ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         MarketTabBar(
           controller: _controller,
         ),
         MarketPageView(
           controller: _controller,
         ),
       ],
      ),
    );
  }
}
class MarketTabBar extends StatelessWidget {
  final TabController controller;

  const MarketTabBar({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Color.fromRGBO(242, 242, 242, 1.0),
            height: 1.0,
          ),
        ),
        TabBar(
          controller: controller,
          indicatorColor: Color.fromRGBO(41, 143, 227, 1.0),
          labelColor: Color.fromRGBO(41, 143, 227, 1.0),
          unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1.0),
          labelStyle: TextStyle(fontSize: 16.0),
          indicatorWeight: 1.0,
          tabs: <Widget>[
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(
                    AppIcons.RISE,
                    size: 14.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('涨幅榜'),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(
                    AppIcons.FALL,
                    size: 14.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('跌幅榜'),
                ],
              ),
            ),
            Tab(
              text: '成交排行',
            )
          ],
        ),
      ],
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
    return Container(
      height: ScreenUtil.setHeight(510.0),
      child: TabBarView(
        controller: controller,
        children: <Widget>[
        const MarketListView(type: 1),
        const MarketListView(type: 2),
        const MarketListView(type: 3),
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