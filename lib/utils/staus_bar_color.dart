import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class StatusBarUtils{
static Future setBackgroundBarColor(Color color){
   FlutterStatusbarcolor.setStatusBarColor(color);
  if (useWhiteForeground(color)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
}
static Future setNavigationBarColor(Color color){
  FlutterStatusbarcolor.setNavigationBarColor(color);
  if (useWhiteForeground(color)) {
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  } else {
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
}
}