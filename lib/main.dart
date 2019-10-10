/*
* @overview: main入口
* @Author: moxcong 
* @Date: 2019-10-09 13:42:44 
*/
import 'package:bit_dev_app/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/staus_bar_color.dart';

import 'package:bit_dev_app/pages/home/HomeStates.dart';

main() async{
  await StatusBarUtils.setBackgroundBarColor(Colors.transparent);
  await StatusBarUtils.setNavigationBarColor(Colors.white);
  runApp(App());
}

class App extends StatelessWidget{
  Color _themeColor=Colors.blue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: MyHomePage(title: "bit_123",),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  final bodyList = [HomeStates(),HomeStates(),HomeStates()];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar:PreferredSize(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 0,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 10),
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: bodyList,
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('币币')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('法币')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text('资产')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的')
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
