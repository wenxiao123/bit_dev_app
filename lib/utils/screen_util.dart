/*
* @overview: 屏幕适配
* @Author: moxcong 
* @Date: 2019-08-19 13:43:05 
*/

import 'package:flutter/material.dart';

class ScreenUtil {
  static const double _designSizeWidth = 750.0;
  static const double _designSizeHeight = 1334.0;
  static double _screenWidth;
  static double _screenHeight;
  static double _screenPixelRatio;
  static MediaQueryData _mediaQuery;

  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    _screenWidth = _mediaQuery.size.width;
    _screenHeight = _mediaQuery.size.height;
    _screenPixelRatio = _mediaQuery.devicePixelRatio;
  }

  ///屏幕宽度
  static double get screenWidth => _screenWidth;

  ///屏幕高度
  static double get screenHeight => _screenHeight;
  static double get designSizeWidth => _designSizeWidth;
  static double get designSizeHeight => _designSizeHeight;
  static double get screenPixelRatio => _screenPixelRatio;

  ///设置宽度
  static double setWidth(double widthSize) {
    return screenWidth / designSizeWidth * widthSize;
  }

  ///设置高度
  static double setHeight(double heightSize) {
    return screenHeight / designSizeHeight * heightSize;
  }
}
