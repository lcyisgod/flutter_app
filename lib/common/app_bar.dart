import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key key,
    this.backgroundColor: Colors.white,
    this.title: '',
    this.centerTitle: '',
    this.isBack: true,
    this.onBackPressed,
    this.onPressend,
    this.backImg,
    this.actionName,
    this.rightImg,
    this.context,
  }) : super(key: key);
  @required   final BuildContext context;
  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final bool isBack;
  final String backImg;
  final VoidCallback onBackPressed;
  final VoidCallback onPressend;
  final String actionName;
  final String rightImg;
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    //判断是否处于暗黑模式
    //当前只对iOS生效
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;
    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: isDark?Colors.blue:backgroundColor,
        child: SafeArea(
            child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: centerTitle.isEmpty
                      ? Alignment.centerLeft
                      : Alignment.center,
                  width: double.infinity,
                  child: Text(
                    title.isEmpty ? centerTitle : title,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                ),
              ],
            ),
            isBack
                ? IconButton(
                    icon: Image.asset(backImg, color: Colors.white),
                    padding: const EdgeInsets.all(12.0),
                    onPressed: onBackPressed == null
                        ? () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.maybePop(context);
                          }
                        : () {
                            onBackPressed();
                          })
                : SizedBox(),
            //设置右侧的按钮
            Positioned(
                right: 0.0,
                child: Theme(
                    data: ThemeData(
                        buttonTheme: ButtonThemeData(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minWidth: 60.0,
                    )),
                    child: actionName.isEmpty
                        ? (rightImg.isEmpty
                            ? Container()
                            : InkWell(
                                onTap: onPressend,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 18.0),
                                  child: Image.asset(
                                    'assets/images/$rightImg.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ))
                        : FlatButton(
                            onPressed: onPressend,
                            child: Text(
                              actionName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4688FA),
                              ),
                            )))),
          ],
        )),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
