/*
* @overview: App 点击组件
* @Author: moxcong 
* @Date: 2019-09-25 15:42:52 
*/
import 'package:flutter/material.dart';

class AppOnTap extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const AppOnTap({
    Key key,
    @required this.onTap,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
