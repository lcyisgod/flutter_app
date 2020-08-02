import 'dart:io';

import 'package:flutter/material.dart';

class MyThemData {
  //不同主题颜色
  final Color textColor = const  Color.fromARGB(255, 255, 0, 0);
  final Color textColorDark = const Color.fromARGB(255, 0, 0, 250);

  //不同主题图片路径


  //darkModel:是否适配暗黑模式
  Color colorStyle (BuildContext context, bool darkModel ,String colorName) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark;
    if (Platform.isAndroid) {
      isDark = false;
    } else {
      isDark = brightness == Brightness.dark;
    }
    if(colorName == 'textColor'){
      return darkModel ? (isDark ? textColorDark : textColor) : textColor;
    }else {
      return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  String imageName (BuildContext context,bool darkModel, String imageName) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark;
    if (Platform.isAndroid) {
      isDark = false;
    } else {
      isDark = brightness == Brightness.dark;
    }
    if (imageName == ''){
      return isDark?'暗黑模式图片路径':'正常模式图片路径';
    }else {
      return '一张默认图片路径';
    }
  }
}






